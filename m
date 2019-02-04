Return-Path: <matthias.bgg@gmail.com>
Return-Path: <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 2/6] remoteproc/mediatek: add SCP support for mt8183
References: <20190131093131.245531-1-pihsun@chromium.org>
 <20190131093131.245531-3-pihsun@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <f0aeabf4-1ebe-ddf5-1ea3-27db5e51e04d@gmail.com>
Date: Mon, 4 Feb 2019 18:59:28 +0100
MIME-Version: 1.0
In-Reply-To: <20190131093131.245531-3-pihsun@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Pi-Hsun Shih <pihsun@chromium.org>
Cc: Erin Lo <erin.lo@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, open list <linux-kernel@vger.kernel.org>, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
List-ID: <linux-remoteproc@vger.kernel.org>



On 31/01/2019 10:31, Pi-Hsun Shih wrote:
> From: Erin Lo <erin.lo@mediatek.com>
[...]
> +struct platform_device *scp_get_plat_device(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *scp_node;
> +	struct platform_device *scp_pdev;
> +
> +	scp_node = of_parse_phandle(dev->of_node, "mediatek,scp", 0);

IHMO this should be reflected in the binding description

Regards,
Matthias
