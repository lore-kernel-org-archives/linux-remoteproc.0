Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F44A3EA953;
	Wed, 20 May 2026 16:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779296292; cv=none; b=LOZ+DHdES7yTWUKCEiMQHSiuYGn/gPMa1d9bwD4H8Bdbp8V3fSv8jJIXfwEK4iFZFlhmJsbSw0AxoEnwsCPlufejvE36w+lDhdOIg/P+11yhSE+avMKhgGWVwjVe2tJ2ltd6LxfeSN6kQE2jzO/hNuXhI0sAKSG+7c/s4VKph8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779296292; c=relaxed/simple;
	bh=bVcP/aJZZ+bB4VgJiU5DuE2T6t9aYInb3Raktfgd62Y=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=cMt0Co0blpdeZuikSk2jWWl+j7iASVZqv1MIt2fEcBv2i+MgUJRa+IYiqSxAFmGe18sfZ9Ma9OMQ8k3lYa6JkJ+PkDnsgM1YlSaCHwUOY6rVK/MyAMRsSmS2wqaHBD3R2V+5Qxjnji9qMxZoaGF56HC5sPYl0RXTPp7i1C5A/Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GYsbXkOL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GYsbXkOL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28C01F000E9;
	Wed, 20 May 2026 16:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779296291;
	bh=kLVDFFs0ueJHpFJ5OSehtykxxE2mbwX6aQ3/A/ELP8g=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=GYsbXkOLOOh6zvHULzRgvtEQzXM8mjB6n2PwoMo8oxUp+sQvJUn7UFKUADB8E5xct
	 WexGm4iX8lixkZ5oMSdnKeTenSkLQ7/t30IPGNodW8V/wSktTZ6dN68IQUjZxQMtv3
	 lm477Ts3rKV+6+I3F3NjWoGPqVuja/3zWuQ6f6IEo+47wCPvScsYPhanQCjL30s28E
	 OzS4t3q5tWULqoxWx45NxxiB1/ZQFcYC76vtTapSZByYlV1ks2o42yZBF9ZVJ5nHz/
	 mVvHTWsNGBIwLi1Wf6lwuKwDwUx1cxKMGm0BsT0tKi4MX8IMikOWszGecJXdWdW3sD
	 EWLnSJnUCwNzQ==
Date: Wed, 20 May 2026 11:58:10 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260520-shikra-rproc-v2-1-583a2e413a3a@oss.qualcomm.com>
References: <20260520-shikra-rproc-v2-0-583a2e413a3a@oss.qualcomm.com>
 <20260520-shikra-rproc-v2-1-583a2e413a3a@oss.qualcomm.com>
Message-Id: <177929629036.534086.9871910456803819494.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: qcom,shikra-pas:
 Document Shikra PAS remoteprocs


On Wed, 20 May 2026 20:08:05 +0530, Komal Bajaj wrote:
> Document the bindings for the CDSP, LPAICP and MPSS PAS on
> the Shikra SoC.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  .../bindings/remoteproc/qcom,shikra-pas.yaml       | 157 +++++++++++++++++++++
>  1 file changed, 157 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml: properties:qcom,smem-states:items:0: 'anyOf' conditional failed, one must be fixed:
	'items' is a required property
	'minItems' is a required property
	'maxItems' is a required property
	from schema $id: http://devicetree.org/meta-schemas/items.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260520-shikra-rproc-v2-1-583a2e413a3a@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

