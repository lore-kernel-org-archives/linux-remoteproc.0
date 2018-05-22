Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 22 May 2018 17:33:54 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] remoteproc:  Add APSS based Qualcomm ADSP PIL driver for
 SDM845
Message-ID: <20180522223354.GA14150@rob-hp-laptop>
References: <1526194908-19027-1-git-send-email-rohitkr@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1526194908-19027-1-git-send-email-rohitkr@codeaurora.org>
To: Rohit kumar <rohitkr@codeaurora.org>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bgoswami@codeaurora.org, sbpata@codeaurora.org, asishb@codeaurora.org, rkarra@codeaurora.org, RajendraBabu Medisetti <rajendrabm@codeaurora.org>, Krishnamurthy Renu <krishnamurthy.renu@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Sun, May 13, 2018 at 12:31:48PM +0530, Rohit kumar wrote:
> This adds Qualcomm ADSP PIL driver support for SDM845 with ADSP bootup
> and shutdown operation handled from Application Processor SubSystem(APSS).
> 
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
> Signed-off-by: RajendraBabu Medisetti <rajendrabm@codeaurora.org>
> Signed-off-by: Krishnamurthy Renu <krishnamurthy.renu@codeaurora.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,adsp.txt   |   1 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/remoteproc/Makefile                        |   3 +-
>  drivers/remoteproc/qcom_adsp_pil.c                 | 122 ++++-----
>  drivers/remoteproc/qcom_adsp_pil.h                 |  86 ++++++
>  drivers/remoteproc/qcom_adsp_pil_sdm845.c          | 304 +++++++++++++++++++++
>  5 files changed, 454 insertions(+), 62 deletions(-)
>  create mode 100644 drivers/remoteproc/qcom_adsp_pil.h
>  create mode 100644 drivers/remoteproc/qcom_adsp_pil_sdm845.c
