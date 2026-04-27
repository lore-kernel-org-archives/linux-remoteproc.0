Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894FA3B8D4A;
	Mon, 27 Apr 2026 12:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777293590; cv=none; b=p5ojgDZ9aYVbZYlZomSW7BG3/JiT0cPOcHU4iUjOzAnTgQplWO3kGJInQhUCez0udyORfg4/uoARN+HL6+8S++6q+eamVewM8B2a49P9VstGShUX8zWMWifBSQAfsb/3vjA1guHg8p+1O1gFR0yhbST4HbdmlAfNqKIdsKKoTgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777293590; c=relaxed/simple;
	bh=B6VXB3n93X8gQas+e8Yh7Mmm6pVyLJdNvfAKeHZtWuI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=bcALVtrKz5C955IETXD04yRNJN/UnwhPrzrF/QJHLY7ZxsIKhoMdRa9YMGsaZRDF2+8FF0X5z7sV9Z+UK4J/Usti/R7fBhD7D9aI5EGwSyVo9EPb1a4j6eE3j8466siDIGVoQHVdsdnWp02opQgTWN3A3VEPOQvXIYNRqev6ON0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SEdolQrk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SEdolQrk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA629C19425;
	Mon, 27 Apr 2026 12:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777293590;
	bh=B6VXB3n93X8gQas+e8Yh7Mmm6pVyLJdNvfAKeHZtWuI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=SEdolQrkY49wv+MM4qEkvALcwMpbb0oXZH16A8bc8mYX5c+E7xMGPIxt06/5wBMk2
	 xhswo/oTLqCb2cOsjDqgTHUhr2pvauHIITQNBY2qmsm0308ZmnEPDszb2o8huKxCNN
	 f5CCUvp9jlbjuhCT3ZdQkmTJiVsCdkmVO2aNL5mkwNfhKi1Ko/aJcmLmwYxlT7Vwsw
	 RzZGzuzwE7jJciqCr9ar7VMpi8vOBjkMZbTGaN2nSHvJuDs0Mz/bFlUrb8tXzZgUYN
	 7zGBgT2/OW/aQrUdd9p/kkFHGy+YWBb+dXpyHwj61BXnsvTS1BMAbothMwKyCT5CEM
	 vYJw0fb2MhYHg==
Date: Mon, 27 Apr 2026 07:39:48 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Hailong Fan <Hailong.Fan@mediatek.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Justin Yeh <Justin.Yeh@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, 
 Xiangzhi Tang <Xiangzhi.Tang@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Vince-WL Liu <Vince-WL.Liu@mediatek.com>, 
 Huayu Zong <Huayu.Zong@mediatek.com>, 
 Jarried Lin <Jarried.Lin@mediatek.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
To: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
In-Reply-To: <20260427111446.22955-2-xiangzhi.tang@mediatek.com>
References: <20260427111446.22955-1-xiangzhi.tang@mediatek.com>
 <20260427111446.22955-2-xiangzhi.tang@mediatek.com>
Message-Id: <177729358821.1983670.16657208241339249962.robh@kernel.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: remoteproc: Add MediaTek mt8196
 VCP binding


On Mon, 27 Apr 2026 19:04:40 +0800, Xiangzhi Tang wrote:
> Add device tree binding for the MediaTek Video Companion Processor
> (VCP), a RISC-V based coprocessor used for video processing and
> multimedia tasks on mt8196 and future MediaTek SoCs.
> 
> The VCP is a heterogeneous multi-core processor that can contain
> multiple RISC-V cores with different hart (hardware thread)
> configurations. Key features:
> 
> - Supports both single-core and multi-core VCP configurations
> - Each core can have 1 or 2 harts (hardware threads)
> - Shared SRAM memory space partitioned among cores
> - Communication via 5 dedicated mailbox channels for IPI messaging
> - Integrated with SoC IOMMU for multimedia memory management
> - Boot and power management coordinated with ARM Trusted Firmware
> 
> The binding defines both the top-level VCP device (with mailboxes,
> interrupts, and power domains) and child nodes for individual VCP
> cores (with SRAM allocation and hart configuration).
> 
> Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
> ---
>  .../remoteproc/mediatek,mt8196-vcp.yaml       | 166 ++++++++++++++++++
>  1 file changed, 166 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.example.dts:26:18: fatal error: dt-bindings/power/mt8196-power.h: No such file or directory
   26 |         #include <dt-bindings/power/mt8196-power.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1635: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260427111446.22955-2-xiangzhi.tang@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

