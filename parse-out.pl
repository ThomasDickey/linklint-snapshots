
#==============================================================================
# start of auto generated code by read-parse.pl
#==============================================================================

        if (/^a$/) {
            $att =~ /\shref${ATTRIB}/io and do {
                $temp = $+;
                $temp =~ /^#/ && ($temp = "$BaseFile$temp");
                $anch = $temp =~ /(#.*)$/ ? $1 : '';
                $url = &UniqueUrl($temp);
                $list{$url}++;
                %ProtoJS && $url =~ /^javascript:/ && &ProtoJS($url, $referer);
                $anch && $url =~ m#^/# && $Arg{yes_anchors} &&
                    &AppendList(*WantAnch, "$url$anch", $link);
            };
            $att =~ /\sname${ATTRIB}/io and
                $Arg{yes_anchors}
                && ! $IGNORE_ANCHOR{$+}
                && ($Anchor{"$CurFile#$+"} = "\n");
            $att =~ /\sid${ATTRIB}/io and
                $Arg{yes_anchors}
                && ! $IGNORE_ANCHOR{$+}
                && ($Anchor{"$CurFile#$+"} = "\n");
        }
        elsif (/^applet$/) {
            $att =~ /\scode${ATTRIB}/io and do {
                $code = $+;
                $code =~ /\.class$/i || ( $code .= ".class" );
                my ($jar, $base);
                $att =~ /\sarchive${ATTRIB}/io and $jar = $+;
                my $file = $jar || $code || next;
                $att =~ /\scodebase${ATTRIB}/io and do {
                    ($base = $+) =~ s#/$##;
                    $file = "$base/$file";
                };
                $list{&UniqueUrl($file)}++;;
            };
            $att =~ /\sid${ATTRIB}/io and
                $Arg{yes_anchors}
                && ! $IGNORE_ANCHOR{$+}
                && ($Anchor{"$CurFile#$+"} = "\n");
        }
        elsif (/^area$/) {
            $att =~ /\shref${ATTRIB}/io and
                $list{&UniqueUrl($+)}++;
            $att =~ /\sid${ATTRIB}/io and
                $Arg{yes_anchors}
                && ! $IGNORE_ANCHOR{$+}
                && ($Anchor{"$CurFile#$+"} = "\n");
        }
        elsif (/^base$/) {
            $att =~ /\shref${ATTRIB}/io and do {
                $DbP && print $ErrTag;
                &BaseTag($+);;
            };
        }
        elsif (/^body$/) {
            $att =~ /\sbackground${ATTRIB}/io and
                $list{&UniqueUrl($+)}++;
        }
        elsif (/^bgsound$/) {
            $att =~ /\ssrc${ATTRIB}/io and
                $list{&UniqueUrl($+)}++;
            $att =~ /\sid${ATTRIB}/io and
                $Arg{yes_anchors}
                && ! $IGNORE_ANCHOR{$+}
                && ($Anchor{"$CurFile#$+"} = "\n");
        }
        elsif (/^embed$/) {
            $att =~ /\ssrc${ATTRIB}/io and
                $list{&UniqueUrl($+)}++;
            $att =~ /\sid${ATTRIB}/io and
                $Arg{yes_anchors}
                && ! $IGNORE_ANCHOR{$+}
                && ($Anchor{"$CurFile#$+"} = "\n");
        }
        elsif (/^form$/) {
            $att =~ /\saction${ATTRIB}/io and do {
                $temp = &UniqueUrl($+);
                &AppendList(*Action, $temp, $link);
                $list{$temp}++;
            };
            $att =~ /\sid${ATTRIB}/io and
                $Arg{yes_anchors}
                && ! $IGNORE_ANCHOR{$+}
                && ($Anchor{"$CurFile#$+"} = "\n");
        }
        elsif (/^frame$/) {
            $att =~ /\ssrc${ATTRIB}/io and
                $list{&UniqueUrl($+)}++;
            $att =~ /\sid${ATTRIB}/io and
                $Arg{yes_anchors}
                && ! $IGNORE_ANCHOR{$+}
                && ($Anchor{"$CurFile#$+"} = "\n");
        }
        elsif (/^head$/) {
        }
        elsif (/^html$/) {
        }
        elsif (/^img$/) {
            $att =~ /\ssrc${ATTRIB}/io and
                $list{&UniqueUrl($+)}++;
            $att =~ /\slowsrc${ATTRIB}/io and
                $list{&UniqueUrl($+)}++;
            $att =~ /\sdynsrc${ATTRIB}/io and
                $list{&UniqueUrl($+)}++;
            $att =~ /\susemap${ATTRIB}/io and do {
                $temp = $+;
                $temp =~ /^#/ && ($temp = "$BaseFile$temp");
                $anch = $temp =~ /(#.*)$/ ? $1 : '';
                $url = &UniqueUrl($temp);
                $list{$url}++;
                $anch && $url =~ m#^/# &&
                &AppendList(*WantMap, "$url$anch", $link);
            };
            $att =~ /\sid${ATTRIB}/io and
                $Arg{yes_anchors}
                && ! $IGNORE_ANCHOR{$+}
                && ($Anchor{"$CurFile#$+"} = "\n");
        }
        elsif (/^input$/) {
            $att =~ /\ssrc${ATTRIB}/io and
                $list{&UniqueUrl($+)}++;
            $att =~ /\sid${ATTRIB}/io and
                $Arg{yes_anchors}
                && ! $IGNORE_ANCHOR{$+}
                && ($Anchor{"$CurFile#$+"} = "\n");
        }
        elsif (/^link$/) {
            $att =~ /\shref${ATTRIB}/io and
                $list{&UniqueUrl($+)}++;
        }
        elsif (/^map$/) {
            $att =~ /\sname${ATTRIB}/io and
                 ($ImgMap{"$CurFile#$+"} = "\n");
            $att =~ /\sid${ATTRIB}/io and
                 ($ImgMap{"$CurFile#$+"} = "\n");
        }
        elsif (/^meta$/) {
            $att =~ /\shttp-equiv${ATTRIB}/io and do {
                $+ =~ /^refresh$/i || next;
                $att =~ /\scontent\s*=\s*"([^"]*)"/i || next;
                $1 =~ /url=([^"\s]+)/i || next;
                $temp = $1;
                $temp =~ m#^\w+://# ||
                &Warn("re-direct should be absolute", $link);
                $url = &UniqueUrl($temp);
                $list{$url}++;
            };
        }
        elsif (/^style$/) {
        }
        elsif (/^title$/) {
        }
        else {
            $att =~ /\sid${ATTRIB}/io and
                $Arg{yes_anchors}
                && ! $IGNORE_ANCHOR{$+}
                && ($Anchor{"$CurFile#$+"} = "\n");
        }

#==============================================================================
# end of auto generated code
#==============================================================================

