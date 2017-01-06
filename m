Return-Path: <peter.griffin@linaro.org>
Return-Path: <peter.griffin@linaro.org>
Date: Fri, 6 Jan 2017 16:32:59 +0000
From: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [STLinux Kernel] [PATCH v1 0/3] remoteproc: st: add virtio_rpmsg
 support
Message-ID: <20170106163259.GA4438@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1481142826-15528-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481142826-15528-1-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org, patrice.chotard@st.com, linux-remoteproc@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, 07 Dec 2016, Loic Pallardy wrote:

> Goal of this series is:
> - to add vring based communication link (virtio_rpmsg)
> - to add rproc_da_to_va translation function to allow firmware loading in
>   pre-reserved carveout memory region
> 
> Loic Pallardy (3):
>   remoteproc: st: add virtio communication support
>   remoteproc: st: add da to va support
>   remoteproc: core: don't allocate carveout if pa or da are defined

For the series: -

Acked-by: Peter Griffin <peter.griffin@linaro.org>
