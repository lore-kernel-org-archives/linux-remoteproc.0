Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 11 Mar 2019 17:09:53 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 1/7] dt-bindings: Add a binding for Mediatek SCP
Message-ID: <20190311220953.GA8432@bogus>
References: <20190311063458.137473-1-pihsun@chromium.org>
 <20190311063458.137473-2-pihsun@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190311063458.137473-2-pihsun@chromium.org>
To: Pi-Hsun Shih <pihsun@chromium.org>
Cc: Erin Lo <erin.lo@mediatek.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, 11 Mar 2019 14:34:52 +0800, Pi-Hsun Shih wrote:
> From: Erin Lo <erin.lo@mediatek.com>
> 
> Add a DT binding documentation of SCP for the
> MT8183 SoC from Mediatek.
> 
> Signed-off-by: Erin Lo <erin.lo@mediatek.com>
> ---
> Changes from v5:
>  - Remove dependency on CONFIG_RPMSG_MTK_SCP.
> 
> Changes from v4:
>  - Add detail of more properties.
>  - Document the usage of mtk,rpmsg-name in subnode from the new design.
> 
> Changes from v3:
>  - No change.
> 
> Changes from v2:
>  - No change. I realized that for this patch series, there's no need to
>    add anything under the mt8183-scp node (neither the mt8183-rpmsg or
>    the cros-ec-rpmsg) for them to work, since mt8183-rpmsg is added
>    directly as a rproc_subdev by code, and cros-ec-rpmsg is dynamically
>    created by SCP name service.
> 
> Changes from v1:
>  - No change.
> ---
>  .../bindings/remoteproc/mtk,scp.txt           | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
