Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 2/2] rpmsg: Introduce Qualcomm RPM glink driver
References: <20170316052639.11391-1-bjorn.andersson@linaro.org>
 <20170316052639.11391-2-bjorn.andersson@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <6264649c-7a73-45b1-d387-77e841d565a5@linaro.org>
Date: Mon, 20 Mar 2017 10:06:41 +0000
MIME-Version: 1.0
In-Reply-To: <20170316052639.11391-2-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>




On 16/03/17 05:26, Bjorn Andersson wrote:
> This introduces a basic driver for communicating over "native glink"
> with the RPM found in Qualcomm platforms.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Tested this patch on DB820c with some additional DT patches for 
regulators, I can see UFS and SD card working perfectly fine with this 
patch.

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>  drivers/rpmsg/Kconfig          |    8 +
>  drivers/rpmsg/Makefile         |    1 +
>  drivers/rpmsg/qcom_glink_rpm.c | 1249 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 1258 insertions(+)
>  create mode 100644 drivers/rpmsg/qcom_glink_rpm.c
>
