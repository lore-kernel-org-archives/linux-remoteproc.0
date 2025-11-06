Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C069F2F361F
	for <linux-remoteproc@vger.kernel.org>; Thu,  6 Nov 2025 12:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762432291; cv=none; b=Xi2f0F0J5xAfheC3ijhsDkfNtomZrFCVq5aQrAarpTn3wZ/gSmd9EauYl5JmemNON/frP5Vgm9fdi6qB0Oa30Ez4Lt3oU3ykzUZGi8fOR0DNN1gI0WLMZ9qKSteWKOh3hFENIjzM3vbuDKYwy2unJMPZPgwl1djLK7syGkQbZLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762432291; c=relaxed/simple;
	bh=K60Mo+s7dbIJsbciyBo42EThKakFnYo7BZE4xOdOnCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CW5hIQS7dA351Lm3bRomRLeFAiy5eQrMs3E/G+r+Ul4+7L58OOHBG+0kkSl78BHj3bmmQck1E3sU1zUg4EZ187uL+C1mPf5SXo6uumknrXtp5dRx1RKcMYPR44p2Y5E/Ot9B9PimA64hEEFcax1bYJ9dAw8ZD+Ayf1Pn3+su1Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W+F7gcQd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MtKAeFXz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W+F7gcQd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MtKAeFXz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6ASsOd3749048
	for <linux-remoteproc@vger.kernel.org>; Thu, 6 Nov 2025 12:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qjj+QBaDInsXfXxbUNAL4B1lu0Uvbge8gSGkcg+9kCY=; b=W+F7gcQdrvMjRLYx
	QCER3VX9iIbnJ5gbWy3k5MtDQ2jiy4MKmn1NBq8c8/negwia1AHsloxufa4tcO86
	N1nn6ftXl8/jBYEdqQp9PjyMpza+3WQkWOjyFBIlfrBneNbxc30tx3WvbxWdgTKi
	MfkhHxzFqMJQTNQm8+yAfDhiQapcgrTOMEzF9BoYvmqjMObZg0c1sVI6r0EBE/yZ
	wtgKqzFb1bWTmfV5Sr2rFkmv5t1zFB9h/8j/Pngs+wRkjUC+w5sZkbDv4vdo2VAG
	bp5WI7/st/85U+yQ4DhHD/h7uRgk6DRZ/pXhLNSaLeJvrG3ZgXEmaIbsM5TDVb/L
	Sy5CiA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8sy6g9mx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 06 Nov 2025 12:31:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7ae9be0d8d5so709515b3a.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 06 Nov 2025 04:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762432287; x=1763037087; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qjj+QBaDInsXfXxbUNAL4B1lu0Uvbge8gSGkcg+9kCY=;
        b=MtKAeFXz5jxhPVmFsLFZ5syta2iYw0W+XqGTFT0odkJjK1loMGbF/V+PUk0CrO39/n
         KMzSatltCKbphDdeCHuDetB67mYdOCq4bAP3cuJPw3mbXA1oD+4hQoNY0NUoHRCVBUl8
         APhrBP/ZRixHM9F8KTRZBD3DikmbxiS7lfY26HkuKCWnRXJvH2cOSgKf5S92dS20C07F
         5qehw0VypkaPzqnGmTochXYmEPeVKXcCh5XOTSL+qyaZFVu4Se9/7VzR/xn0YbIcZI1n
         mufTbpvWiY6qSG2wmDo5FvTW9anhMHgCZWrlIDeVXM8HwSv8Hyk/R8HWSptbkuOy9mQl
         grDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762432287; x=1763037087;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qjj+QBaDInsXfXxbUNAL4B1lu0Uvbge8gSGkcg+9kCY=;
        b=fSyl+EFD45N1WTBIOAl/Fe3x1YHVn+Kn/ZFUmryRZBbCGh08Si76sK2T+ZCyC9ZCCt
         dtbgc1iJwFzHwWim3VjikA1f8Mpkw2fTTsaIlrFuwvaBki8jfiXNxenq1D1I/rKQ+UXk
         Uq089cv9gsU9sbRW89cvP7fhOk8IDxDZ3aUJckVoaempncO6p6v8/ulX6/f15e9IoDXb
         80c+ls5fbmUgEwrVuh+zI84fvQg5MAWvgSn4qd/274EK0b35MQzzxkz93GSg5VORkJvc
         nUKI/5zmF4cjVjTykWQJeSvi2zoP2ayP/4VXo3tHSYMW86XFGMnMLL7apZKji55DlRsg
         HaWA==
X-Forwarded-Encrypted: i=1; AJvYcCVrva2jjq2s7616eWwZwsAtD0bzKXj76xLEY8R/NLN/AeBGL9rYpSeqszpBs+/ofvi4loxeEnPmGa9E0BIX5eV0@vger.kernel.org
X-Gm-Message-State: AOJu0YypQerm7RTg7CBrP3DYtVIYUWi8LAtKF1TdyHmsHCFGaPV1CrYU
	kUx3tBXZXNllY09ZmTTFkU4HGQObP+36RTUYCgBf6lunLgNppZM2rd3EFORSlSo6kvmF8J0dhs2
	jDs9aVVpP4oSBEchQ74WQSyjTEzYMzQLIOOMQBVwBxf+Oh7k4oErjJGNm3YerXdovFNMoUKlW
X-Gm-Gg: ASbGncs1iA2+K76AEPnXeiuoPnJiB+NoPhUqWxMxJxD41ELp+nyLscnBFwzUKacHCwk
	0etxO6z9ocofkT1arXoNggjBjadELhTrQadj81+R4s49RL8J3zxqPGS8fq/HRat0jbd8AhXo8Sk
	+4rGLj0Y3pgo8FrDW3FkByglR+Xq2JV8JddXoeps0Usy3orUY6SBCvsZSe1YPfZje86sFFuK7Hs
	zpfDNrQrN9203NrKbdngtnn+qZJMq7s0o29Ilr917N/eF9y2gVJwgpLQdDCSQiWU3n4QlF/lUFL
	olHQpSd4yS/CdVnBxbDSmsKtPWjG2zaGhlO6kdmfvPOpjDfJhdO0o6BKyeOrXVaU3KSo7vNjqfy
	tTKQE3mPucn1Wzt3NM8YhnssP6nqkadzGAZEULncLh/ELaph0mBZz2So3BNeRvqputlkKjbk=
X-Received: by 2002:a05:6a00:2d06:b0:793:11fc:783f with SMTP id d2e1a72fcca58-7ae1f88d49emr8765895b3a.29.1762432287189;
        Thu, 06 Nov 2025 04:31:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG75PqOaLkYAniMFlBOQLbATtdKixQY+QD+kP+iUj4dsUvm4BQRvME30Q2HB7LbSA6fruzZFg==
X-Received: by 2002:a05:6a00:2d06:b0:793:11fc:783f with SMTP id d2e1a72fcca58-7ae1f88d49emr8765848b3a.29.1762432286426;
        Thu, 06 Nov 2025 04:31:26 -0800 (PST)
Received: from [10.133.33.147] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7af825fbc63sm2695815b3a.49.2025.11.06.04.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 04:31:25 -0800 (PST)
Message-ID: <d28a3fa6-f092-4186-afd7-8005aecbfc38@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 20:31:17 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-imx@nxp.com, Andrew Lunn <andrew@lunn.ch>,
        zhongqiu.han@oss.qualcomm.com
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-5-shenwei.wang@nxp.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20251104203315.85706-5-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AYu83nXG c=1 sm=1 tr=0 ts=690c9520 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=uyWvSDY7ZH1JoBaCOfwA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA5OCBTYWx0ZWRfX0PEG6aOZXkQj
 t40SrlEhN8JTlUEBrDEYPtndpS1oA4TDBYmykj/6uBAJnRsZU+qV9hPhIqVGkjel2MVydk6WPs0
 8zfKzwmL24+WjMc1rQSYOOlIFoiLQSaD1XMV6bINYoXmUCO+2uYtJWcZZA+8mglQKCWP8BS95rf
 o5Kdr0AZrCzFVLJDwKdNsPuooqTvbJk8z9pjSi7DctvKGSZO+fvu6a3pjorKXkzVqXwGfwGb7Zr
 Zjs94lIPYTB0EbeypEYPHTbrM5Q8go0BgR6Z15psQaOrZIL5ajotbsFB51MHvSi/xUL1h0KK8e9
 Ygcx3L8FzY+de1FWntlwLSctH/8QwSKIzdObVY2WJIyPGznF251cUVNnwm84HJ8kWmDYywgSnCT
 ls30Ls86Q3EwHSaNooH3mYmvSbq9eg==
X-Proofpoint-ORIG-GUID: iu1O_5mldVpJ0D9OvIkqHzdzDFI1XZPv
X-Proofpoint-GUID: iu1O_5mldVpJ0D9OvIkqHzdzDFI1XZPv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060098

On 11/5/2025 4:33 AM, Shenwei Wang wrote:
> On i.MX SoCs, the system may include two processors:
> 	- An MCU running an RTOS
> 	- An MPU running Linux
> 
> These processors communicate via the RPMSG protocol.
> The driver implements the standard GPIO interface, allowing
> the Linux side to control GPIO controllers which reside in
> the remote processor via RPMSG protocol.
> 
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>   drivers/gpio/Kconfig          |  17 ++
>   drivers/gpio/Makefile         |   1 +
>   drivers/gpio/gpio-imx-rpmsg.c | 475 ++++++++++++++++++++++++++++++++++
>   3 files changed, 493 insertions(+)
>   create mode 100644 drivers/gpio/gpio-imx-rpmsg.c
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index a437fe652dbc..97eda94b0ba1 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1847,6 +1847,23 @@ config GPIO_SODAVILLE
> 
>   endmenu
> 
> +menu "RPMSG GPIO drivers"
> +	depends on RPMSG
> +
> +config GPIO_IMX_RPMSG
> +	tristate "NXP i.MX SoC RPMSG GPIO support"
> +	depends on IMX_REMOTEPROC
> +	select GPIOLIB_IRQCHIP
> +	default IMX_REMOTEPROC
> +	help
> +	  Say yes here to support the RPMSG GPIO functions on i.MX SoC based
> +	  platform.  Currently supported devices: i.MX7ULP, i.MX8ULP, i.MX8x,
> +	  and i.MX9x.
> +
> +	  If unsure, say N.
> +
> +endmenu
> +
>   menu "SPI GPIO expanders"
>   	depends on SPI_MASTER
> 
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 379f55e9ed1e..e01465c03431 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -83,6 +83,7 @@ obj-$(CONFIG_GPIO_I8255)		+= gpio-i8255.o
>   obj-$(CONFIG_GPIO_ICH)			+= gpio-ich.o
>   obj-$(CONFIG_GPIO_IDIO_16)		+= gpio-idio-16.o
>   obj-$(CONFIG_GPIO_IDT3243X)		+= gpio-idt3243x.o
> +obj-$(CONFIG_GPIO_IMX_RPMSG)		+= gpio-imx-rpmsg.o
>   obj-$(CONFIG_GPIO_IMX_SCU)		+= gpio-imx-scu.o
>   obj-$(CONFIG_GPIO_IT87)			+= gpio-it87.o
>   obj-$(CONFIG_GPIO_IXP4XX)		+= gpio-ixp4xx.o
> diff --git a/drivers/gpio/gpio-imx-rpmsg.c b/drivers/gpio/gpio-imx-rpmsg.c
> new file mode 100644
> index 000000000000..888c3fdeaa04
> --- /dev/null
> +++ b/drivers/gpio/gpio-imx-rpmsg.c
> @@ -0,0 +1,475 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2025 NXP
> + *
> + * The driver exports a standard gpiochip interface to control
> + * the GPIO controllers via RPMSG on a remote processor.
> + */
> +
> +#include <linux/completion.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/init.h>
> +#include <linux/irqdomain.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/rpmsg.h>
> +#include <linux/rpmsg/imx_rpmsg.h>
> +
> +#define IMX_RPMSG_GPIO_PER_PORT	32
> +#define RPMSG_TIMEOUT	1000
> +
> +enum gpio_input_trigger_type {
> +	GPIO_RPMSG_TRI_IGNORE,
> +	GPIO_RPMSG_TRI_RISING,
> +	GPIO_RPMSG_TRI_FALLING,
> +	GPIO_RPMSG_TRI_BOTH_EDGE,
> +	GPIO_RPMSG_TRI_LOW_LEVEL,
> +	GPIO_RPMSG_TRI_HIGH_LEVEL,
> +};
> +
> +enum gpio_rpmsg_header_type {
> +	GPIO_RPMSG_SETUP,
> +	GPIO_RPMSG_REPLY,
> +	GPIO_RPMSG_NOTIFY,
> +};
> +
> +enum gpio_rpmsg_header_cmd {
> +	GPIO_RPMSG_INPUT_INIT,
> +	GPIO_RPMSG_OUTPUT_INIT,
> +	GPIO_RPMSG_INPUT_GET,
> +	GPIO_RPMSG_DIRECTION_GET,
> +};
> +
> +struct gpio_rpmsg_data {
> +	struct imx_rpmsg_head header;
> +	u8 pin_idx;
> +	u8 port_idx;
> +	union {
> +		u8 event;
> +		u8 retcode;
> +		u8 value;
> +	} out;
> +	union {
> +		u8 wakeup;
> +		u8 value;
> +	} in;
> +} __packed __aligned(8);
> +
> +struct imx_rpmsg_gpio_pin {
> +	u8 irq_shutdown;
> +	u8 irq_unmask;
> +	u8 irq_mask;
> +	u32 irq_wake_enable;
> +	u32 irq_type;
> +	struct gpio_rpmsg_data msg;
> +};
> +
> +struct imx_gpio_rpmsg_info {
> +	struct rpmsg_device *rpdev;
> +	struct gpio_rpmsg_data *notify_msg;
> +	struct gpio_rpmsg_data *reply_msg;
> +	struct completion cmd_complete;
> +	struct mutex lock;
> +	void **port_store;
> +};
> +
> +struct imx_rpmsg_gpio_port {
> +	struct gpio_chip gc;
> +	struct imx_rpmsg_gpio_pin gpio_pins[IMX_RPMSG_GPIO_PER_PORT];
> +	struct imx_gpio_rpmsg_info info;
> +	int idx;
> +};
> +

Hello Shenwei,
I'd like to go over a few aspects of this patch.


> +static int gpio_send_message(struct imx_rpmsg_gpio_port *port,
> +			     struct gpio_rpmsg_data *msg,
> +			     bool sync)
> +{
> +	struct imx_gpio_rpmsg_info *info = &port->info;
> +	int err;
> +
> +	if (!info->rpdev) {
> +		dev_dbg(&info->rpdev->dev,

1.NULL pointer dereference here.

> +			"rpmsg channel doesn't exist, is remote core ready?\n");
> +		return -EINVAL;
> +	}
> +
> +	reinit_completion(&info->cmd_complete);
> +	err = rpmsg_send(info->rpdev->ept, (void *)msg,
> +			 sizeof(struct gpio_rpmsg_data));
> +	if (err) {
> +		dev_err(&info->rpdev->dev, "rpmsg_send failed: %d\n", err);
> +		return err;
> +	}
> +
> +	if (sync) {
> +		err = wait_for_completion_timeout(&info->cmd_complete,
> +						  msecs_to_jiffies(RPMSG_TIMEOUT));
> +		if (!err) {
> +			dev_err(&info->rpdev->dev, "rpmsg_send timeout!\n");
> +			return -ETIMEDOUT;
> +		}
> +
> +		if (info->reply_msg->out.retcode != 0) {
> +			dev_err(&info->rpdev->dev, "remote core replies an error: %d!\n",
> +				info->reply_msg->out.retcode);
> +			return -EINVAL;
> +		}
> +
> +		/* copy the reply message */
> +		memcpy(&port->gpio_pins[info->reply_msg->pin_idx].msg,
> +		       info->reply_msg, sizeof(*info->reply_msg));
> +	}
> +
> +	return 0;
> +}
> +
> +static struct gpio_rpmsg_data *gpio_setup_msg_header(struct imx_rpmsg_gpio_port *port,
> +						     unsigned int offset,
> +						     u8 cmd)
> +{
> +	struct gpio_rpmsg_data *msg = &port->gpio_pins[offset].msg;
> +
> +	memset(msg, 0, sizeof(struct gpio_rpmsg_data));
> +	msg->header.cate = IMX_RPMSG_GPIO;
> +	msg->header.major = IMX_RMPSG_MAJOR;
> +	msg->header.minor = IMX_RMPSG_MINOR;
> +	msg->header.type = GPIO_RPMSG_SETUP;
> +	msg->header.cmd = cmd;
> +	msg->pin_idx = offset;
> +	msg->port_idx = port->idx;
> +
> +	return msg;
> +};
> +
> +static int imx_rpmsg_gpio_get(struct gpio_chip *gc, unsigned int gpio)
> +{
> +	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	struct gpio_rpmsg_data *msg = NULL;
> +	int ret;
> +
> +	guard(mutex)(&port->info.lock);
> +
> +	msg = gpio_setup_msg_header(port, gpio, GPIO_RPMSG_INPUT_GET);
> +
> +	ret = gpio_send_message(port, msg, true);
> +	if (!ret)
> +		ret = !!port->gpio_pins[gpio].msg.in.value;
> +
> +	return ret;
> +}
> +
> +static int imx_rpmsg_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
> +{
> +	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	struct gpio_rpmsg_data *msg = NULL;
> +	int ret;
> +
> +	guard(mutex)(&port->info.lock);
> +
> +	msg = gpio_setup_msg_header(port, gpio, GPIO_RPMSG_DIRECTION_GET);
> +
> +	ret = gpio_send_message(port, msg, true);
> +	if (!ret)
> +		ret = !!port->gpio_pins[gpio].msg.in.value;
> +
> +	return ret;
> +}
> +
> +static int imx_rpmsg_gpio_direction_input(struct gpio_chip *gc,
> +					  unsigned int gpio)
> +{
> +	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	struct gpio_rpmsg_data *msg = NULL;
> +
> +	guard(mutex)(&port->info.lock);
> +
> +	msg = gpio_setup_msg_header(port, gpio, GPIO_RPMSG_INPUT_INIT);
> +
> +	return gpio_send_message(port, msg, true);
> +}
> +
> +static int imx_rpmsg_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
> +{
> +	struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
> +	struct gpio_rpmsg_data *msg = NULL;
> +
> +	guard(mutex)(&port->info.lock);
> +
> +	msg = gpio_setup_msg_header(port, gpio, GPIO_RPMSG_OUTPUT_INIT);
> +	msg->out.value = val;
> +
> +	return gpio_send_message(port, msg, true);
> +}
> +
> +static int imx_rpmsg_gpio_direction_output(struct gpio_chip *gc,
> +					unsigned int gpio, int val)
> +{
> +
> +	return imx_rpmsg_gpio_set(gc, gpio, val);
> +}
> +
> +static int imx_rpmsg_irq_set_type(struct irq_data *d, u32 type)
> +{
> +	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 gpio_idx = d->hwirq;
> +	int edge = 0;
> +	int ret = 0;
> +
> +	switch (type) {
> +	case IRQ_TYPE_EDGE_RISING:
> +		edge = GPIO_RPMSG_TRI_RISING;
> +		break;
> +	case IRQ_TYPE_EDGE_FALLING:
> +		edge = GPIO_RPMSG_TRI_FALLING;
> +		break;
> +	case IRQ_TYPE_EDGE_BOTH:
> +		edge = GPIO_RPMSG_TRI_BOTH_EDGE;
> +		break;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		edge = GPIO_RPMSG_TRI_LOW_LEVEL;
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		edge = GPIO_RPMSG_TRI_HIGH_LEVEL;
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	port->gpio_pins[gpio_idx].irq_type = edge;
> +
> +	return ret;
> +}
> +
> +static int imx_rpmsg_irq_set_wake(struct irq_data *d, u32 enable)
> +{
> +	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 gpio_idx = d->hwirq;
> +
> +	port->gpio_pins[gpio_idx].irq_wake_enable = enable;
> +
> +	return 0;
> +}
> +
> +/*
> + * This function will be called at:
> + *  - one interrupt setup.
> + *  - the end of one interrupt happened
> + * The gpio over rpmsg driver will not write the real register, so save
> + * all infos before this function and then send all infos to M core in this
> + * step.
> + */
> +static void imx_rpmsg_unmask_irq(struct irq_data *d)
> +{
> +	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 gpio_idx = d->hwirq;
> +
> +	port->gpio_pins[gpio_idx].irq_unmask = 1;
> +}
> +
> +static void imx_rpmsg_mask_irq(struct irq_data *d)
> +{
> +	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 gpio_idx = d->hwirq;
> +	/*
> +	 * No need to implement the callback at A core side.
> +	 * M core will mask interrupt after a interrupt occurred, and then
> +	 * sends a notify to A core.
> +	 * After A core dealt with the notify, A core will send a rpmsg to
> +	 * M core to unmask this interrupt again.
> +	 */
> +	port->gpio_pins[gpio_idx].irq_mask = 1;
> +}
> +
> +static void imx_rpmsg_irq_shutdown(struct irq_data *d)
> +{
> +	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 gpio_idx = d->hwirq;
> +
> +	port->gpio_pins[gpio_idx].irq_shutdown = 1;
> +}
> +
> +static void imx_rpmsg_irq_bus_lock(struct irq_data *d)
> +{
> +	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +
> +	mutex_lock(&port->info.lock);
> +}
> +
> +static void imx_rpmsg_irq_bus_sync_unlock(struct irq_data *d)
> +{
> +	struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	struct gpio_rpmsg_data *msg = NULL;
> +	u32 gpio_idx = d->hwirq;
> +
> +	if (port == NULL) {
> +		mutex_unlock(&port->info.lock);
> +		return;
> +	}
> +

2.Unlocking port->info.lock when port is NULL will crash due to a NULL
pointer dereference. Please fix the logic as well.> +	/*
> +	 * For mask irq, do nothing here.
> +	 * M core will mask interrupt after a interrupt occurred, and then
> +	 * sends a notify to A core.
> +	 * After A core dealt with the notify, A core will send a rpmsg to
> +	 * M core to unmask this interrupt again.
> +	 */
> +
> +	if (port->gpio_pins[gpio_idx].irq_mask && !port->gpio_pins[gpio_idx].irq_unmask) {
> +		port->gpio_pins[gpio_idx].irq_mask = 0;
> +		mutex_unlock(&port->info.lock);
> +		return;
> +	}
> +
> +	msg = gpio_setup_msg_header(port, gpio_idx, GPIO_RPMSG_INPUT_INIT);
> +
> +	if (port->gpio_pins[gpio_idx].irq_shutdown) {
> +		msg->out.event = GPIO_RPMSG_TRI_IGNORE;
> +		msg->in.wakeup = 0;
> +		port->gpio_pins[gpio_idx].irq_shutdown = 0;
> +	} else {
> +		 /* if not set irq type, then use low level as trigger type */
> +		msg->out.event = port->gpio_pins[gpio_idx].irq_type;
> +		if (!msg->out.event)
> +			msg->out.event = GPIO_RPMSG_TRI_LOW_LEVEL;
> +		if (port->gpio_pins[gpio_idx].irq_unmask) {
> +			msg->in.wakeup = 0;
> +			port->gpio_pins[gpio_idx].irq_unmask = 0;
> +		} else /* irq set wake */
> +			msg->in.wakeup = port->gpio_pins[gpio_idx].irq_wake_enable;
> +	}
> +
> +	gpio_send_message(port, msg, false);
> +	mutex_unlock(&port->info.lock);
> +}
> +
> +static const struct irq_chip imx_rpmsg_irq_chip = {
> +	.irq_mask = imx_rpmsg_mask_irq,
> +	.irq_unmask = imx_rpmsg_unmask_irq,
> +	.irq_set_wake = imx_rpmsg_irq_set_wake,
> +	.irq_set_type = imx_rpmsg_irq_set_type,
> +	.irq_shutdown = imx_rpmsg_irq_shutdown,
> +	.irq_bus_lock = imx_rpmsg_irq_bus_lock,
> +	.irq_bus_sync_unlock = imx_rpmsg_irq_bus_sync_unlock,
> +	.flags = IRQCHIP_IMMUTABLE,
> +};
> +
> +static int imx_rpmsg_gpio_callback(struct rpmsg_device *rpdev,
> +	void *data, int len, void *priv, u32 src)
> +{
> +	struct gpio_rpmsg_data *msg = (struct gpio_rpmsg_data *)data;
> +	struct imx_rpmsg_gpio_port *port = NULL;
> +	struct imx_rpmsg_driver_data *drvdata;
> +
> +	drvdata = dev_get_drvdata(&rpdev->dev);
> +	if (msg)
> +		port = drvdata->channel_devices[msg->port_idx];
> +
> +	if (!port)
> +		return -ENODEV;
> +
> +	if (msg->header.type == GPIO_RPMSG_REPLY) {
> +		port->info.reply_msg = msg;
> +		complete(&port->info.cmd_complete);
> +	} else if (msg->header.type == GPIO_RPMSG_NOTIFY) {
> +		port->info.notify_msg = msg;
> +		generic_handle_domain_irq_safe(port->gc.irq.domain, msg->pin_idx);
> +	} else
> +		dev_err(&rpdev->dev, "wrong command type!\n");
> +
> +	return 0;
> +}
> +
> +static void imx_rpmsg_gpio_remove_action(void *data)
> +{
> +	struct imx_rpmsg_gpio_port *port = data;
> +
> +	port->info.port_store[port->idx] = NULL;
> +}
> +
> +static int imx_rpmsg_gpio_probe(struct platform_device *pdev)
> +{
> +	struct imx_rpmsg_driver_data *pltdata = pdev->dev.platform_data;
> +	struct imx_rpmsg_gpio_port *port;
> +	struct gpio_irq_chip *girq;
> +	struct gpio_chip *gc;
> +	int ret;
> +
> +	if (!pltdata)
> +		return -EPROBE_DEFER;
> +
> +	port = devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
> +	if (!port)
> +		return -ENOMEM;
> +
> +	ret = device_property_read_u32(&pdev->dev, "reg", &port->idx);
> +	if (ret)
> +		return ret;
> +
> +	if (port->idx > MAX_DEV_PER_CHANNEL)
> +		return -EINVAL;
> +
> +	ret = devm_mutex_init(&pdev->dev, &port->info.lock);
> +	if (ret)
> +		return ret;
> +
> +	init_completion(&port->info.cmd_complete);
> +	port->info.rpdev = pltdata->rpdev;
> +	port->info.port_store = pltdata->channel_devices;
> +	port->info.port_store[port->idx] = port;
> +	if (!pltdata->rx_callback)
> +		pltdata->rx_callback = imx_rpmsg_gpio_callback;
> +
> +	gc = &port->gc;
> +	gc->owner = THIS_MODULE;
> +	gc->parent = &pdev->dev;
> +	gc->label = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-gpio%d",
> +				   pltdata->rproc_name, port->idx);
> +	gc->ngpio = IMX_RPMSG_GPIO_PER_PORT;
> +	gc->base = -1;
> +
> +	gc->direction_input = imx_rpmsg_gpio_direction_input;
> +	gc->direction_output = imx_rpmsg_gpio_direction_output;
> +	gc->get_direction = imx_rpmsg_gpio_get_direction;
> +	gc->get = imx_rpmsg_gpio_get;
> +	gc->set = imx_rpmsg_gpio_set;
> +
> +	platform_set_drvdata(pdev, port);
> +	girq = &gc->irq;
> +	gpio_irq_chip_set_chip(girq, &imx_rpmsg_irq_chip);
> +	girq->parent_handler = NULL;
> +	girq->num_parents = 0;
> +	girq->parents = NULL;
> +	girq->chip->name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-gpio%d",
> +					  pltdata->rproc_name, port->idx);
> +
> +	ret = devm_add_action_or_reset(&pdev->dev, imx_rpmsg_gpio_remove_action, port);
> +	if (ret)
> +		return ret;
> +
> +	return devm_gpiochip_add_data(&pdev->dev, gc, port);
> +}
> +
> +static const struct of_device_id imx_rpmsg_gpio_dt_ids[] = {
> +	{ .compatible = "fsl,imx-rpmsg-gpio" },
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver imx_rpmsg_gpio_driver = {
> +	.driver	= {
> +		.name = "gpio-imx-rpmsg",
> +		.of_match_table = imx_rpmsg_gpio_dt_ids,
> +	},
> +	.probe = imx_rpmsg_gpio_probe,
> +};
> +
> +module_platform_driver(imx_rpmsg_gpio_driver);
> +
> +MODULE_AUTHOR("Shenwei Wang <shenwei.wang@nxp.com>");
> +MODULE_DESCRIPTION("NXP i.MX SoC rpmsg gpio driver");
> +MODULE_LICENSE("GPL");
> --
> 2.43.0
> 
> 


-- 
Thx and BRs,
Zhongqiu Han
