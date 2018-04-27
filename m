Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 27 Apr 2018 08:37:27 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] rpmsg: qcom_smd: Access APCS through mailbox framework
Message-ID: <20180427133727.gr5turvdfycgmbzm@rob-hp-laptop>
References: <20180420011757.22389-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180420011757.22389-1-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Nicolas Dechesne <nicolas.dechesne@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Apr 19, 2018 at 06:17:57PM -0700, Bjorn Andersson wrote:
> Attempt to acquire the APCS IPC through the mailbox framework and fall
> back to the old syscon based approach, to allow us to move away from
> using the syscon.
> 
> Reviewed-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v2:
> - Added comment about mbox_send_message() return value.
> 
>  .../devicetree/bindings/soc/qcom/qcom,smd.txt      |  8 ++-
>  drivers/rpmsg/Kconfig                              |  1 +
>  drivers/rpmsg/qcom_smd.c                           | 67 ++++++++++++++++------
>  3 files changed, 56 insertions(+), 20 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
