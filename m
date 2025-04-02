Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26C62376F7;
	Wed,  2 Apr 2025 12:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598528; cv=none; b=E/1PKff598L8O1uA+vNKNpC2LDzaWXPMvvZO8dhgh8sW5ecl4L9PFh1gczLkgwjKxxD4X8jxqJqfJVVvE+BEX9WmKUyzM4dbn7xWqIMyUOmY1Bu1/2wr2sY7I77VZ8c+ttzkp1effRTneGR8LV9whd1OIsniZ8V80JEadyWZSpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598528; c=relaxed/simple;
	bh=KLUcO4PETxRtJ7bSzZDcl4QzL3KsG5+5Tq3fAEUTpLQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=C/MBhKiXO3h62QCY3BgPMjq2f04Sgqln4eWoUgf6wM7Ll3aUp42/LimVokcKLdrQtmatbl3dyG+Glp38Ia00pGArgyhufPBQCP8Tl3skQWQ6KJ9iYmy3PttvWSjNiFI7mtSo6mwzWG8H8ylVb8/KFH0aqsfKPHA3yrbLSdkeWoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IXkHxxk4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IXkHxxk4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2860C4CEDD;
	Wed,  2 Apr 2025 12:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743598527;
	bh=KLUcO4PETxRtJ7bSzZDcl4QzL3KsG5+5Tq3fAEUTpLQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=IXkHxxk41GO44tK70RVcRfKfgdhBtcyxVbaLKM7n4Z3jxTjVgb3zuO0Sb3Dzzu+22
	 wdHoqCt+9NhCXNfexVLwZU1cheoCxr6z97bLZF5ZMoGy/p3Kg0kGcKtU0mcka0FdhB
	 LRJGQD+ODZNaI6ID56uO1l9rR7hjfxaD5is34slsc3l+sRBEt05yah6cGDXNSSr1+o
	 vVAXjen+z1rwrHTUvB1Rzg+wQ0F9Gs6+O2Fy6nbLmVtfQ2dc03MGPh2pCCddjauqNR
	 d9rBiHU91AUWGHp2Y3l86l3+Jly/zOTeMBsW7/Fbp7FMRR+g2jWIkcW/QhwNQ+frK7
	 zlCYyYqqzbigA==
Date: Wed, 02 Apr 2025 07:55:26 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-remoteproc@vger.kernel.org, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, hailong.fan@mediatek.com, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Xiangzhi Tang <Xiangzhi.Tang@mediatek.com>, 
 linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, jjian.zhou@mediatek.com, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
To: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
In-Reply-To: <20250402092134.12293-2-xiangzhi.tang@mediatek.com>
References: <20250402092134.12293-1-xiangzhi.tang@mediatek.com>
 <20250402092134.12293-2-xiangzhi.tang@mediatek.com>
Message-Id: <174359852621.53914.11998352307162389918.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: Add VCP support for
 mt8196


On Wed, 02 Apr 2025 17:19:24 +0800, Xiangzhi Tang wrote:
> Add the new binding document for MediaTek Video Companion
> Processor(VCP) on MediaTek mt8196.
> 
> Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
> ---
>  .../remoteproc/mediatek,mt8196-vcp.yaml       | 174 ++++++++++++++++++
>  1 file changed, 174 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.example.dts:26:18: fatal error: dt-bindings/power/mt8196-power.h: No such file or directory
   26 |         #include <dt-bindings/power/mt8196-power.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1522: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mailbox/mediatek,mt8196-vcp-mbox.yaml
Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml: Documentation/devicetree/bindings/mailbox/mediatek,mt8196-vcp-mbox.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250402092134.12293-2-xiangzhi.tang@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

