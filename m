Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 6 May 2016 11:18:10 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/4] rpmsg: add THIS_MODULE to rpmsg_driver in rpmsg
 core
Message-ID: <20160506181810.GC1256@tuxbot>
References: <1462399299-28159-1-git-send-email-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1462399299-28159-1-git-send-email-afd@ti.com>
To: "Andrew F. Davis" <afd@ti.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Jonathan Corbet <corbet@lwn.net>, Suman Anna <s-anna@ti.com>, linux-remoteproc@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 04 May 15:01 PDT 2016, Andrew F. Davis wrote:

> Add register_rpmsg_driver helper macro that adds THIS_MODULE to
> rpmsg_driver for the registering driver. We rename and modify
> the existing register_rpmsg_driver to enable this.
> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Acked-by: Suman Anna <s-anna@ti.com>
> ---

Thanks Andrew, the patches looks good now.

I picked all four patches.

Regards,
Bjorn
