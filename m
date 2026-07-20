Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A4C3B27C4;
	Mon, 20 Jul 2026 06:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784527966; cv=none; b=SPM7g9MGDQn2dKksRmVmZLGlOOGy/kGmrl3PQpznXSOJkdML4toJjmkSTMFu7ssfP+34/+8YBVmzu9lFsTnBv0hVWffKsMOqxcITEF+BOe9BQT22pkL6Fd+gdWU5BU3WYnPYziLyJ278n7sEKzcs/UetrevhWeN/nuxVgIlxDnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784527966; c=relaxed/simple;
	bh=4tqnF8mraxaW6ubK4HCyrqXrmRyF4POX73TL6XMo9rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDgwP12biHG9mhpMZzEY2WtBJRXjTq9v3G/sHpdgNLa/YadQMDqdQ6EdfOprEB11Z8kVB2J+YJ96dnDmgp9jLz1ssXpq32ezlt9ORafl4ezlCEfY+oj5GDfIjaVAPRe4a9pwM5oNr2sjUzSMIsZS3x2i8in+LYKH/UYUkb7qJpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gfkZQKky; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gfkZQKky"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67E5A1F000E9;
	Mon, 20 Jul 2026 06:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784527956;
	bh=Nu+FY+ZcI+FAkWUBpcEznAfWbuoAYrgqN8sPbxow1NQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gfkZQKkyOZSxJIbgLqGrO+4Ue9/+diPsPWPIh8cbPxAKhRt0oGs3yd+LcHaSrvdMi
	 0jZjEZ5JewkzI3pfI3nekSWyd2mT48TEnMSPXrgOeyRPDxCBvlvVQAmbd/jNGlPwOy
	 I4mMIRf6w4wMYzZ1vZynEEzOFLKj+rWX2iKuw4KXoTSaU5NRDL29vCo/2HNJ9UNxn2
	 NFLLp2DMHT/DAPCWO43CfGfw0CcZq30yUHbWnKLQKP7CJzuObAOlhO/VC6HB5UNwUE
	 KvV+vsD7oLKNlsn1pY2sOLFQ1FVxj4X2CFylWN16cxF5i+YkZxuMI1841VbdEK2F3k
	 Nhlkv5Vt4N5oA==
Date: Mon, 20 Jul 2026 08:12:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: monaco: enable audio ML offload
 memory and SMMU mappings
Message-ID: <20260720-romantic-radical-avocet-bccad4@quoll>
References: <20260717095825.3962666-1-pratyush.meduri@oss.qualcomm.com>
 <20260717095825.3962666-4-pratyush.meduri@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717095825.3962666-4-pratyush.meduri@oss.qualcomm.com>

On Fri, Jul 17, 2026 at 03:28:25PM +0530, Pratyush Meduri wrote:
> The audio ML (machine-learning) offload use case requires a contiguous,
> physically addressable buffer shared with the audio DSP/SPF, and issues
> DMA transactions through additional SMMU stream IDs that are not
> covered by the existing ADSP mapping.
> 
> Add a dedicated reusable shared-dma-pool CMA region (16 MiB, 4 MiB
> aligned) and wire it to the q6apm DAIs node via memory-region. A
> dedicated pool guarantees the alignment and contiguity the DSP expects
> and isolates these allocations from the default CMA region.
> 
> Under the EL2 (Gunyah/hypervisor) configuration the SMMU is fully
> enforcing, so the ML transactions are otherwise blocked and faulted:
> 
>  arm-smmu 15000000.iommu: Blocked unknown Stream ID 0x2060
>  arm-smmu 15000000.iommu: Blocked unknown Stream ID 0x2062
> 
> Add the ML-related stream IDs (0x3060 mask 0x9, 0x3062 mask 0x1) to the
> remoteproc_adsp iommus property in the EL2 overlay so these buffers are
> translated by the SMMU instead of being rejected.
> 
> Signed-off-by: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-el2.dtso | 4 +++-
>  arch/arm64/boot/dts/qcom/monaco.dtsi     | 9 +++++++++
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 

NAK, you keep ignoring us.

Best regards,
Krzysztof

