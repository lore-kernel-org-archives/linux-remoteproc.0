Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B923BB57;
	Thu, 24 Sep 2026 00:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790208077; cv=none; b=PXDcApwMO1Lj1Vf3uQggM4v4TkO2AwfakfVc5iNysr1pqNuunYFA84CmD2GAGIoGI48U0jhgMmWLGjjZB2RssLt4KaQ5EAEbgmsiDrvwnPxofgU1EqiwAQTedz9wvZFOKUXc5Sd2NhInEuNKVoc0soznSQMbqU7MTZKoTfRfw/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790208077; c=relaxed/simple;
	bh=GupVj96H8dz2QFcvfvHdFq7LSHLNcZzD9x2lDjkSwGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y7KwK0+wbr2x39hDQsM6E0zGN4pmKpA+WryE9CNT1g2NWtOID3VwUa587dp5aSGb+UYXLvIkJP6L9fzDsrN+1iHwVl7r+1muTpqS8mPbf9KdiYnutY/Mn06K7gewRJsUcrPhOnr4/4tZOZf/+AOU2GQhPVCZX5f64bWENpV6ePw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XMMv5Yrs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XMMv5Yrs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6DBE1F000FF;
	Thu, 24 Sep 2026 00:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790208076;
	bh=dZlzId3RS58Gzb7rS+WrfiYVKCUjniJG45GhMMYyUAA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XMMv5Yrsl4aQD7dHYOUOmTpQomAT1s1PDxFXs1vjIu70NmsySFLJ/i/ZSzTWSB319
	 FSCZspxDdtJIK7FjgbHKsT4gGKJqQhPmZfkfinJzMSBNo4ZIhftLdD/VL0fI2x80Or
	 kIWy5bHCnab6pUkxU1HWm8SdLeqt/BmY/dugGVdeGM2RDEnDU/A/0I5MbDw+nRY4d7
	 amnRDKn3k3D9RZGZ97iCklwT1iIZUCtLlPd8LE90YURe+CDnd195RXpXO00QvBnRA3
	 9YLda4HsD6HyZ+oq1+ozRjpbH89RoTliIIQY7nLXAXL3hXUOZyZ8nK76YbQbS6R6cZ
	 l5xysaXPH6Jnw==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] dt-bindings/dts: qcom: Consolidate SDX75/Hawi/Maili MPSS onto SM8650 fallback
Date: Wed, 23 Sep 2026 19:01:11 -0500
Message-ID: <179020806086.529109.15678139725722719430.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com>
References: <20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 05 Aug 2026 18:51:26 +0530, Mukesh Ojha wrote:
> The MPSS remoteproc block on the SDX75, Hawi, and Maili SoCs is compatible
> with the SM8650 MPSS - identical interrupts, memory-region layout, and
> power-domain topology. Today SDX75 and SM8650 MPSS each carry their own
> standalone compatible and are repeated in every "mpss" allOf conditional.
> The duplication hides the hardware relationship and grows every time a new
> SoC reuses the block.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: remoteproc: qcom,sm8550-pas: Add Hawi and Maili MPSS as SM8650 fallback
      commit: bd79ab72b62c0e0f1466d3dca53dcb12d5a072d9
[2/3] dt-bindings: remoteproc: qcom,sm8550-pas: Make SDX75 MPSS fallback to SM8650
      commit: 96e47e798cd157d32face71551242d2b6fe42b89
[3/3] arm64: dts: qcom: sdx75: Use SM8650 MPSS as fallback compatible
      commit: 106aaacd18cdd0dc13d9e1a7d8cf8e1e5d965384

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
