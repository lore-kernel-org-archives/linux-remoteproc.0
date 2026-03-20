Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3DB2D9EE8;
	Fri, 20 Mar 2026 05:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773984305; cv=none; b=EuFweqNxQ+GjKm4rsjnUOSK6xVkbY1c/FziPgYyXeksY9ETUuYZuqjPDqYksD1ZPBPZzF6ZGh9x4XfRZvBsDbo9lv45yrR3dsNs8V5A3WAJwm3koHuHrjea7Cn1NJxcl0zOV08St4zAC7QmGhHcM992dStHf2Obi3kqLC9FTbxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773984305; c=relaxed/simple;
	bh=zaGWASU9+JAdJi4fUavTf9Khqp16CUkVbyblJANVq4s=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=NYgCItAuR1wf4q1f1h2JhSY3c3Ie4GyfO0A0KVwDUy2PEg4fb5eQ+PLPZODRBXET9nsxfSsNkoiC1jtaXApnzdmBndV1iSnOhh9SQuW+SjA0yfO9PwprYEtEtwEWiTOHDQ4fy+HybhlXq/dtH03tLa/WvVb0lPJJ/xabkToCJ+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XgJ4/xi5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XgJ4/xi5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF02BC4CEF7;
	Fri, 20 Mar 2026 05:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773984305;
	bh=zaGWASU9+JAdJi4fUavTf9Khqp16CUkVbyblJANVq4s=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=XgJ4/xi591n6pjBVAauY6nfQ+8bDXa+YT7ICN+1HiuoTPZznzj7jHrkfdJWoiVCaq
	 jwRc1YsTzudfLWScxQbeWsWVO0uMNun2ngs9u8KC2/kIz1kv/XHMD19H0xDX/6v9KI
	 QfZnsWhwELFwoiiuzXhW+Yqxgkj1NRKi+vOCa8LqDFdsvGFfeN0CtRLEw9mVIGXHrp
	 gCB05pIYSEtqvSmWi+O1hROa4Wy5YPRHhw9qFYiCouBqt/7AL5GGN5QqcX1sVnuHWD
	 Wx1rxErjwOAyeIm2x/SUP2zIwsgVE9bp5pDysUNK+F+wFQp1OnXhFpzUlXGR1gZ4gM
	 2vbFUmShVRQDg==
Date: Fri, 20 Mar 2026 00:25:04 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, linux-mediatek@lists.infradead.org, 
 Hailong Fan <Hailong.Fan@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Xiangzhi Tang <Xiangzhi.Tang@mediatek.com>, 
 Huayu Zong <huayu.Zong@mediatek.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>
To: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
In-Reply-To: <20260320032014.13608-2-xiangzhi.tang@mediatek.com>
References: <20260320032014.13608-1-xiangzhi.tang@mediatek.com>
 <20260320032014.13608-2-xiangzhi.tang@mediatek.com>
Message-Id: <177398430412.27959.15021574635894371072.robh@kernel.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: remoteproc: Add VCP support for
 mt8196


On Fri, 20 Mar 2026 11:18:03 +0800, Xiangzhi Tang wrote:
> Add the new binding document for MediaTek Video Companion
> Processor(VCP) on MediaTek mt8196.
> 
> Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.com>
> ---
>  .../remoteproc/mediatek,mt8196-vcp.yaml       | 161 ++++++++++++++++++
>  1 file changed, 161 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.yaml: patternProperties:^vcp@[a-f0-9]+$:properties:mtk,vcp-core-twohart: 'anyOf' conditional failed, one must be fixed:
	'description' is a dependency of '$ref'
	'/schemas/types.yaml#/definitions/uint32' does not match '^#\\/(definitions|\\$defs)\\/'
		hint: A vendor property can have a $ref to a a $defs schema
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml
Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.example.dts:26:18: fatal error: dt-bindings/power/mt8196-power.h: No such file or directory
   26 |         #include <dt-bindings/power/mt8196-power.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/remoteproc/mediatek,mt8196-vcp.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1614: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260320032014.13608-2-xiangzhi.tang@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

