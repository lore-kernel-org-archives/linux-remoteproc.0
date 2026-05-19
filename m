Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BBD2550D5;
	Tue, 19 May 2026 09:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184473; cv=none; b=lEBmbrwO0Ra9IEKnaT4yxo7hqTcrnfoFQX47eXwQP/EIlHcdzgWR7sjaMXBOowFMLMMjjkkMcZP2LwOLWI9e5sWZVYjV84vIidJlJH4WCJXNZZPk+MBIUeFsu9HN/zAopcH4B4sQSUN/KPpCACV23QS1F+vDfCqpsnNwYffQ4x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184473; c=relaxed/simple;
	bh=THaes1BbQCXcAQrkIDiv5GjJoelblGdx+pV8br6MkOY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=qloz4y6bN8Ylo0qaNlNtNBKfqzNVRQ4Mw8OTvZcwdP0oxihRTpXjQWzfMAMmOsGpQNeV3KuDW4Zhm5ITLM5lSnddE4Rba4DN4Ty8I9qq8YjXRANyiCRTcYSsN/oNkDS7YK4NAVxYFsAu6ZfzhpoG2Bd+jR4f3iHjm5Oyf7GGhg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rC5Gv2sN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rC5Gv2sN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 200D5C2BCB3;
	Tue, 19 May 2026 09:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779184473;
	bh=THaes1BbQCXcAQrkIDiv5GjJoelblGdx+pV8br6MkOY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=rC5Gv2sNfAnq+TcxRsPg0ph2PUEM2H9cdzDhHJIYgldE+kliQLEVVuS8XpynlnT3+
	 rnT0S2U/oTg0bd2cWrjTp0DdW8ZFJe62asWzZBZwyyyS+9afnm+8sfh3UixBevs7wx
	 XIi9g6Z9cG6dgD7oZboZy0B+8rBUm+19oCDpcVuwuJsK43Sy8JRmo6oyyEPfdgZuNE
	 BiFRAOcdQGmHMUPf/e/EWbHb0pFmcc3iv5w+GoAH36Hy0z0RMrGvNyYMxTZJzZO0KJ
	 UeU4GDKPVLkKT0+yXE1D8L5pekNggYywuqwJpX5ZZUATYz+gKdDpuIOtJLyaNCAgnk
	 du4i3aQhuzIEQ==
Date: Tue, 19 May 2026 04:54:32 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com, 
 trilok.soni@oss.qualcomm.com, Mathieu Poirier <mathieu.poirier@linaro.org>, 
 shengchao.guo@oss.qualcomm.com, Manivannan Sadhasivam <mani@kernel.org>, 
 yijie.yang@oss.qualcomm.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, tingwei.zhang@oss.qualcomm.com, 
 Luca Weiss <luca.weiss@fairphone.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260519-knp-soccp-v6-4-cf5d0e194b5f@oss.qualcomm.com>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-4-cf5d0e194b5f@oss.qualcomm.com>
Message-Id: <177918447247.2753487.2425115852853158786.robh@kernel.org>
Subject: Re: [PATCH v6 4/6] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Hawi SoC


On Tue, 19 May 2026 00:24:22 -0700, Jingyi Wang wrote:
> From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> Document SoCCP remote processor used on Hawi SoC which is fully
> compatible with Kaanapali.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml: properties:qcom,smem-states:items:1: 'anyOf' conditional failed, one must be fixed:
	'items' is a required property
	'minItems' is a required property
	'maxItems' is a required property
	from schema $id: http://devicetree.org/meta-schemas/items.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260519-knp-soccp-v6-4-cf5d0e194b5f@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

