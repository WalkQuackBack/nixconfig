{ ... }: 

{
    programs.nixcord = {
        enable = true;
        discord.enable = false;
        vesktop = {
            enable = true;
            settings = {
                discordBranch = "stable";
                minimizeToTray = true;
                arRPC = true;
            };
        };
        config = {
            useQuickCss = true;
            disableMinSize = true;
            plugins = {
                clearUrLs.enable = true;
                viewIcons.enable = true;
                vencordToolbox.enable = true;
            };
        };
        # TODO: Move to a seperate repo and import from there
        # Theme optimized for touchscreens, use with Discord Spacious/Default
        quickCss = ''
        @import url('https://rsms.me/inter/inter.css');

        :root {
            --spatial-standard-fast-timing: cubic-bezier(0.27, 1.06, 0.18, 1.00);
            --spatial-standard-fast-duration: .35s;

            --effects-standard-fast-timing: cubic-bezier(0.31, 0.94, 0.34, 1.00);
            --effects-standard-fast-duration: .15s;

            --spatial-expressive-fast-timing: cubic-bezier(0.42, 1.67, 0.21, 0.90);
            --spatial-expressive-fast-duration: .35s;

            --spatial-expressive-default-timing: cubic-bezier(0.38, 1.21, 0.22, 1.00);
            --spatial-expressive-default-duration: .5s;

            --effects-expressive-default-timing: cubic-bezier(0.34, 0.80, 0.34, 1.00);
            --effects-expressive-default-duration: .2s;

            --panel-gap: 6px;
            --min-target-size: 44px;
        }

        /* Increase touch targets */
        :root {
            .side_aa8da2 .item_aa8da2 {
                line-height: 30px;
                margin-block: 0;
                border-radius: 8px;
            }

            /* Remove gaps between DM list items */
            .container_a244c3 {
                padding: 0;
            }
            /* Remove gaps between server list items */
            .wrapper__2ea32 {
                padding: 0;
            }

            /* Increase touch target for DM list items */
            .layout__20a53 {
                height: 52px;
            }
            /* Increase touch target for server list items */
            .link__2ea32 {
                padding: 5px 10px;
            }

            /* Increase touch target for toolbar actions */
            .iconWrapper__9293f,
            /* Increase touch target for activities button */
            .button_e6e74f,
            /* Increase touch target for chatbox toolbar actions */
            .button__74017 {
                width: var(--min-target-size);
                height: var(--min-target-size);
            }
            /* Increase icon size for chatbox toolbar actions */
            .button__74017 [class^='buttonWrapper'],
            [class^='emojiButton'] > div {
                /* 22px icons */
                scale: 1.1;
            }
            /* Increase touch target for attach button */
            .attachButton__74017 {
                margin-right: var(--space-4);
            }
            .attachWrapper__0923f {
                padding-inline: var(--space-4) var(--space-6);
                padding-block: 2px;
            }
            .attachButtonInner__0923f {
                box-sizing: border-box;
                height: var(--min-target-size);
                padding: 12px;
                transition: none;
            }
            /* Increase touch target for send button */
            /* Make send button primary whe activatable */
            .button_aa63ab {
                min-height: var(--min-target-size);
                min-width: var(--min-target-size);
                padding: 4px;

                &[aria-disabled="false"] {
                    background-color: var(--control-background-primary-default);
                    border-color: var(--control-border-primary-default);

                    svg {
                        scale: 1.1;
                    }
                }

                &:not(.noHover__24af7):hover {
                    background-color: var(--control-background-primary-hover);
                    border-color: var(--control-border-primary-hover);
                    .activeButtonChild_aa63ab {
                        color: var(--control-text-primary-hover);
                    }
                }

                .activeButtonChild_aa63ab {
                    color: var(--control-text-primary-default);
                }
            }

            /* Context Menu reduce padding */
            .scroller_c1e9c4 {
                padding: 4px;
                padding-right: 4px !important;
                overflow-y: auto !important;
                border-radius: 0;
            }
            /* Context menu touch target */
            .labelContainer_c1e9c4 {
                padding: 7px 8px;
            }
            /* Context menu item */
            .item_c1e9c4 {
                font-weight: 400;
            }
            /* Context menu divider decrease margin */
            .separator_c1e9c4 {
                margin: 4px 6px;
            }
        }

        /* Button */
        button,
        [class^='button'],
        [class^='buttonChild'],
        [class^='emojiButton'],
        .buttonChild_aa63ab,
        .button__24af7:not(.noHover__24af7) {
            transition: opacity 50ms ease-in !important;
        }

        /* Expand search bar on hover */
        .searchBar__97492 {
            background: var(--background-gradient-lowest, var(--background-base-lowest));
            border-color: var(--border-normal);
            transition: width var(--spatial-expressive-default-duration) var(--spatial-expressive-default-timing);
            &:where(:has(> [tabindex="-1"])) {
                width: 32px;
                margin-inline: -4px;
                background-color: transparent;
                border-color: transparent;
                .DraftEditor-root {
                    opacity: 0;
                    transition: opacity var(--effects-expressive-default-duration) var(--effects-expressive-default-timing);
                }
            }
            
            [class^='icon_'] {
                margin-right: var(--space-8);
            }
            &:focus-within {
                background: var(--background-gradient-lowest, var(--background-base-lowest));
                border-color: var(--border-normal);
                width: 244px;
                .DraftEditor-root {
                    opacity: 1;
                }
            }
        }

        /* Sidebar view */
        .side_aa8da2 .item_aa8da2 {
            border-radius: 18px;
            margin-bottom: 2px;
            padding-bottom: 6px;
            padding-top: 6px;
        }

        /* Gaps */

        /* Main sidebar */
        .sidebarListRounded__5e434 {
            border-top-left-radius: var(--radius-lg);
            border-top-right-radius: var(--radius-md);
            margin-inline-end: var(--panel-gap);
            border-right: 1px solid var(--app-border-frame);
            & > nav,
            & > nav > div:first-child,
            /* Private channels scroller */
            .scroller__99e7c {
                background: var(--background-gradient-high,var(--background-base-lower));
            }
        }

        /* Centre panel */
        /* DM/Server chaT */
        .chat_f75fb0,
        /* Friends outer container */
        .container__133bf,
        /* Friends inner container */
        .container__9293f,
        /* Nitro page */
        .homeWrapper__0920e,
        /* Nitro page outer wrapper */
        .applicationStore_f07d62 {
            border-top-left-radius: var(--radius-md);
        }

        /* Mobile style self panel */
        .panels__5e434 {
            background: var(--background-gradient-low,var(--background-base-low));
            border-top: 1px solid var(--border-faint);
            border-radius: 0;
            bottom: 0;
            left: 0;
            width: calc(100% - var(--panel-gap));
        }
        .container__37e49 {
            padding: var(--space-6);
        }

        /* Top toolbar */
        .toolbar__9293f,
        /* Message bar toolbar */
        .buttons__74017 {
            gap: 0;
        }

        .sidebarResizeHandle__5e434 {
            --custom-overdrag: 2;
        }

        .inTextChannel_b88801 .text_b88801 {
            margin-left: var(--space-8);
        }

        /* Message hover effect */
        .message__5126c.selected__5126c,
        .message__5126c:hover {
            background: var(--background-message-hover);
        }

        /* Round chat box more */
        .channelTextArea__74017,
        .scrollableContainer__74017 {
            border-radius: calc(var(--custom-channel-textarea-text-area-height)/2);
        }
        /* Chatbox shadow */
        .channelTextArea__74017 {
            box-shadow: var(--shadow-low);
            &:hover {
                box-shadow: var(--shadow-low-hover);
            }
        }
        /* Symetrical scroll area chatbox */
        .scrollableContainer__74017 {
            scrollbar-gutter: stable both-edges;
            /* Make chatbox buttons rounded */
            [class^='button'],
            [class^='emojiButton'] {
                border-radius: 22px;
            }
            /* Fix double state layer */
            .attachButton__0923f:hover {
                background-color: transparent;
            }
        }
        .sansAttachButton__74017 {
            padding-left: 3px;
        }

        /* Top bar compression (see also --custom-app-top-bar-height) */
        .bar_c38106 {
            padding: 0 var(--space-4);
        }
        .title_c38106 {
            visibility: hidden;
        }
        .leading_c38106,
        .trailing_c38106 {
            gap: 0;
            transform-origin: right;
            [class^='clickable_'],
            .iconWrapper__9293f {
                --custom-horizontal-padding: 0;
                width: var(--custom-app-top-bar-height);
                height: var(--custom-app-top-bar-height);
            }
            svg {
                scale: 0.9;
            }
        }

        .theme-light, .theme-dark, .theme-midnight {
            /* Inter font nicities */
            --font-primary: InterVariable, Inter, sans-serif;
            --font-display: InterVariable, Inter, sans-serif;

            font-feature-settings: "cv08", "cv05";
            font-optical-sizing: auto;
            font-style: normal;

            /* Spacing */
            --custom-message-margin-horizontal: 14px;

            --custom-guild-list-padding: var(--space-10);
            --custom-guild-list-width: calc(var(--guildbar-avatar-size) + var(--custom-guild-list-padding) * 2);

            --chat-input-icon-size: 22px;
            --custom-channel-textarea-text-area-height: 48px;
            
            --custom-app-top-bar-height: var(--space-xs);
        }
        '';
    };
}
