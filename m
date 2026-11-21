Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795253360;
	b=lkgZmqw2/xglcczc/c93Ved/Gw50PzYTyr4h1Oa3hgWv3dF+I8OACEt+gnx0AANPfLWX
	 JdKeWzGqWY9erT5JBGnoWwslUSZFbvacpqVA27HbxcHvvI+Ufi3dYGbtMf6UpoqvoY8hE
	 vycyJiwZ86/e8Y19qeE5SNpgzhLxcKQ2UhotPK5rLkdNRLN8nG/glhNrJruHShfb0Vwj1
	 MmgyunjP/xmCZx1A5gCEPfvZ3e/qAgd62GT+CD8Xr2FhGHJxlh2SyO9WM87MoJ0YNeBcG
	 l6rmicBax5tALxQEKNIhHCc5StFyXfpHWuKNGdgS7BLiBZfq3winICtjWU/rAF9tDRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795253360;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=GI8ZyhomkX9SOeGQbwiQtxurzIX+mIK3iMVEipRdsds=;
	b=ceLG+l3Ok+TEQJBGkPVZP9HKSSEAS45H9HHI/WThgRERbbAMvWczpk922hoKo5Czy3IT
	 +QeA+RS/fvv9bFcCjeKRgDArn4uOzdRxgFopsU/tiHAeW31c+mZoQQz4JZE6E4QBtMj3f
	 hKVeHcpADFEMMvereMwPST/KHfp4kIDu0H/R8efUA2J2cTFBpRL23A62vS6zwIXUJkcPQ
	 Sv8mJFaEdNvE4UgofjfQ7m/s3u3V5N+/RwYl/xJtuOxERW3YnkQpDc25mECfhRDOzAgvJ
	 hgpqBI1J8zhloa1DWpe38/X1mgTUpbIcyTh77+olOtLjVHrTMWE1zJ1CTcx6XZ1mGaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N6zhZg3Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C47606A320;
	Sat, 21 Nov 2026 09:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N6zhZg3Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E011F000C0;
	Sat, 21 Nov 2026 09:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795253359;
	bh=GI8ZyhomkX9SOeGQbwiQtxurzIX+mIK3iMVEipRdsds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N6zhZg3Z2HWGOKpGsfXYQ3AdVCWwWieaTg7I2IIlvKKafxXeP51oZm/FMzZbRzuMk
	 +OM63TlpcsZF2DbNpL7nKdAAxKmQoWJ1FfYmIxku1p9fWlaplhAfaG4jKp+iP8VPiw
	 B/p5G6KAIKEPSmL/AcEmbkEj+MbIc3G/GpbOmuuDIu4m42DyhrWAOaVdznxnm69zf8
	 JFg1T3PCB4AJ/3gCYuw62i6cjJakLBM+51q1FJXYE/tRqqe8Nti87f4zfzKNHKxmLq
	 EViOzfcDqjXitpY4DCzzF49pK+KblL25aSlfoFqKQ/XaPgmoxL33wjVamimVPv+3Xd
	 kkUGa8F48oFYA==
Date: Sat, 21 Nov 2026 10:29:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kumar Patro <bibek.patro@oss.qualcomm.com>, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Luca Weiss <luca.weiss@fairphone.com>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 3/5] dt-bindings: remoteproc: qcom,sm8550-pas: Allow 6
 iommus for SM8750 ADSP
Message-ID: <20261121-berserk-likable-chowchow-e29c9a@quoll>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
 <20261120-shikra-el2-v7-3-9d9000eb50d4@oss.qualcomm.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261120-shikra-el2-v7-3-9d9000eb50d4@oss.qualcomm.com>

On Fri, Nov 20, 2026 at 06:50:51PM +0530, Komal Bajaj wrote:
> Remote processors behind an IOMMU may use multiple firmware streams. On
> SM8750, ADSP uses six IOMMU streams, which exceeds the single entry
> currently allowed by the binding. CDSP uses a single stream, while MPSS
> does not require any.
> 
> Allow up to six iommus entries in the binding. Require six entries for
> qcom,sm8750-adsp-pas, disallow the property for qcom,sm8750-mpss-pas,
> and retain the single-entry limit for the other compatibles.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 26 +++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

