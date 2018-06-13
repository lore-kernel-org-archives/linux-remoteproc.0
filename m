Return-Path: <niklas.cassel@linaro.org>
Return-Path: <niklas.cassel@linaro.org>
Date: Wed, 13 Jun 2018 15:16:22 +0200
From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH 1/5] rpmsg: smd: Add missing include of sizes.h
Message-ID: <20180613131622.GA12260@centauri.ideon.se>
References: <20180613125401.11734-1-niklas.cassel@linaro.org>
 <20180613125401.11734-2-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180613125401.11734-2-niklas.cassel@linaro.org>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, andy.gross@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, Jun 13, 2018 at 02:53:56PM +0200, Niklas Cassel wrote:
> Add missing include of sizes.h.
> 
> drivers/rpmsg/qcom_smd.c: In function ‘qcom_smd_channel_open’:
> drivers/rpmsg/qcom_smd.c:809:36: error: ‘SZ_4K’ undeclared (first use in this function)
>   bb_size = min(channel->fifo_size, SZ_4K);
>                                     ^~~~~
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> ---

Argh, my git send-email scripts were too stupid to add Andy
and linux-arm-msm to this patch.

Some of the drivers in drivers/soc/qcom depended on this file.

Not sure if this patch should go via Andy's tree or Bjorn's.

Regards,
Niklas
