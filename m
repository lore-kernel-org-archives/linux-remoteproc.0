Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19648313277;
	Fri, 31 Jul 2026 03:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468402; cv=none; b=BFKiAtibRJKmX9qL0N2kIqPrxZKGcsSa9ldlzmEdmPrlqermpC1vm6T6edc3o6HFgxg7cJoisPpp3iCyIcxtxoB5N4PJ/v7EuWtmPQWeDDGGU4JqfFPYcpAz7CU42blWDb7FaWvMVxsKbBkgWa/ZYUpSnFKTlwiOlFdSvYey3J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468402; c=relaxed/simple;
	bh=shLI+HLGeFSZpU2Yd3zKC5cRcK/PSXaZ64NVIXM6JhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VJiiUrmrOw6zxW5KQD+lrYCFGpG9KZSMDdCILYCXffB8w7NIQOEIJKL6uCuq6dLycl1iLW0mGplcP4TEaYou/au4PoWWxbOs1vUyTRwZlZVLADcGT5aHorkY8GwvaVxQFXrhuGMoyBdDkv7PQr/MfA3OVP4M+3mBhuOzuHpBUqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ank+Ghrk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ank+Ghrk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A74B31F000E9;
	Fri, 31 Jul 2026 03:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468400;
	bh=Q4+ITEJJIhnnTzfqq+MeYoO3iZWn67h45nNusF9lkDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ank+GhrkZgCvMZIc0vQ6RyEQNowgauQq07j2gET/3aDgdUA+4b1ovPbHxC7hIyHOm
	 i+X9fYch/JAFTvdshkr+Ii0OF/ZcAlxaHij7PegXq1mr6/jyULBPUBQcEJpkzt0Rxw
	 kp1zOe2Kmxo2R3r3THoVJDTfUeKC6ghG/lyGVkHArH41M/bmI3yQo7xsmbGfdNmvn9
	 IfsvS8pwslSaCgpr4vTDj0ODkTivhf73N6QVkSAp8KRf6CLgThpbvEJoKjvYCVFA3t
	 FUsKDWFWvue4OHRFlOknKrPy2Ad/WHKNWkLoPMpahhpKNuQiPubB6kJ892IkPd4tkV
	 GpQt0rGLo+7BA==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] dt-bindings: remoteproc: qcom,milos-pas: Fix ADSP bindings
Date: Thu, 30 Jul 2026 22:26:32 -0500
Message-ID: <178546838832.317434.4452444773752657992.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722-dts-qcom-eliza-fix-adsp-binding-v2-0-e1e98ae15533@oss.qualcomm.com>
References: <20260722-dts-qcom-eliza-fix-adsp-binding-v2-0-e1e98ae15533@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 22 Jul 2026 12:40:51 +0300, Abel Vesa wrote:
> It has been pointed out [1] that, since the ADSP found on Eliza is
> compatible with the ones from SM8750 class, they should be documented
> in the SM8550 schema.
> 
> So move the compatible from Milos schema to the SM8550 one and then add
> the fallback compatible to the node in the Eliza SoC DTSI.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: remoteproc: qcom,milos-pas: Move Eliza ADSP to SM8550 schema
      commit: 78fb78cb94d389c1696b439623cebe75775f1d4a
[2/2] arm64: dts: qcom: eliza: Add fallback compatible for ADSP remoteproc
      commit: b589944ecd95fe4a51bc2aab13ce83b298b7bcc8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
