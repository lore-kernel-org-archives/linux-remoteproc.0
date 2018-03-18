Return-Path: <bjorn.andersson@linaro.org>
Date: Sun, 18 Mar 2018 15:47:14 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 0/2] rpmsg: use put_device() if device_register fail
Message-ID: <20180318224714.GI5626@tuxbook-pro>
References: <cover.1520501519.git.arvind.yadav.cs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1520501519.git.arvind.yadav.cs@gmail.com>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: ohad@wizery.com, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 08 Mar 01:36 PST 2018, Arvind Yadav wrote:

> if device_register() returned an error! Always use put_device()
> to give up the reference initialized. unregister device for
> other return error.
> 

Patches applied.

Thanks,
Bjorn

> 
> Arvind Yadav (2):
>   [PATCH 1/2] rpmsg: glink: use put_device() if device_register fail
>   [PATCH 2/2] rpmsg: smd: use put_device() if device_register fail
> 
>  drivers/rpmsg/qcom_glink_smem.c | 3 ++-
>  drivers/rpmsg/qcom_smd.c        | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> -- 
> 1.9.1
> 
