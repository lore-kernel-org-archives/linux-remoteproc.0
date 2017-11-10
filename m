Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 10 Nov 2017 15:08:08 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 5/6] remoteproc: qcom: Add support for q6v5-wcss pil
Message-ID: <20171110210808.6sms52m4rrgqnf2r@rob-hp-laptop>
References: <1510238775-14883-1-git-send-email-sricharan@codeaurora.org>
 <1510238775-14883-6-git-send-email-sricharan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1510238775-14883-6-git-send-email-sricharan@codeaurora.org>
To: Sricharan R <sricharan@codeaurora.org>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Nov 09, 2017 at 08:16:14PM +0530, Sricharan R wrote:
> IPQ8074 has an integrated Hexagon dsp core q6v5 and a wireless lan
> (Lithium) IP. An mdt type single image format is used for the
> firmware. So the mdt_load function can be directly used to load
> the firmware. Also add the relevant resets required for this core.
> 
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |  7 ++-

Please add acks when posting new versions.

>  drivers/remoteproc/Kconfig                         |  1 +
>  drivers/remoteproc/qcom_q6v5_pil.c                 | 53 +++++++++++++++++++++-
>  3 files changed, 59 insertions(+), 2 deletions(-)
