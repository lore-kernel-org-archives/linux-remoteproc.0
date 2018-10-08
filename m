Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [PATCH V4 0/4] Add TIOCM Signals support for RPMSG char devices
References: <1538980699-21516-1-git-send-email-aneela@codeaurora.org>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <a64808ba-3c67-3ee9-9c13-3787e5ce7ab1@st.com>
Date: Mon, 8 Oct 2018 15:08:34 +0200
MIME-Version: 1.0
In-Reply-To: <1538980699-21516-1-git-send-email-aneela@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Arun Kumar Neelakantam <aneela@codeaurora.org>, ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org, sricharan@codeaurora.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Arun, Bjorn,

On 10/08/2018 08:38 AM, Arun Kumar Neelakantam wrote:
> Glink transport support signals to exchange state notification between
> local and remote side clients. Adding support to send/receive the signal
> command and notify the clients through callback and POLL notification.

Please correct me if i'm wrong...My concern here is that this patchset
implements a rpmsg service in the rpmsg core. I would separate this from
the rpmsg core, as this is not part of the rpmsg protocol but seems
linked to the serial protocol itself.
Could it be implemented in rpmsg_char, using a dedicated channel...?

Regards
Arnaud

> 
> Changes since v1:
> - Split the patches as per functional areas like core, char, glink
> - Add set, clear mask for TIOCMSET
> - Merge the char signal callback and POLLPRI patches
> 
> Changes since v2:
> - Modify the rpmsg_get_signals function prototype
> 
> Changes since v3:
> - Correct the TICOMGET case handling as per new rpmsg_get_signals prototype
> - Update the rpmsg_get_signals function header
> 
> Arun Kumar Neelakantam (4):
>   rpmsg: core: Add signal API support
>   rpmsg: glink: Add support to handle signals command
>   rpmsg: char: Add TIOCMGET/TIOCMSET ioctl support
>   rpmsg: char: Add signal callback and POLLPRI support
> 
>  drivers/rpmsg/qcom_glink_native.c | 126 ++++++++++++++++++++++++++++++++++++++
>  drivers/rpmsg/rpmsg_char.c        |  74 +++++++++++++++++++++-
>  drivers/rpmsg/rpmsg_core.c        |  41 +++++++++++++
>  drivers/rpmsg/rpmsg_internal.h    |   5 ++
>  include/linux/rpmsg.h             |  26 ++++++++
>  5 files changed, 269 insertions(+), 3 deletions(-)
> 
