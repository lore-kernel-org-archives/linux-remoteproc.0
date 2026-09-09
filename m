Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B686B4BB7EA;
	Wed,  9 Sep 2026 10:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949569; cv=none; b=AZEN2X7MiSGDOT+ouOvmpWSRvGRqfYhhO3IFPV/1LY+k6ShwhIxsQSQGZyoMNDmL4Rh9TMTJ3LoA49AH0QotdndMg/tpag4UNoJFQ2KYt89nGAKDMnHg4jXim4kJ6KcAhvh/bRZVVboJeVYgjqhBHyO4S1luC+DmitKEsw2JigM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949569; c=relaxed/simple;
	bh=RAL8q9pZOQ/kJNw1lYbP1Dy+DrfvCGubvVRG2HXuRIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MUojN4NR2G2YxaN5sdlNivuQKr7xRZJF3N4n2kMFL3RX0yqHtxzx1Cjcc27eU/+8HPHIT5FlclqXbGjBNsWDNZVCVGU6G4WpZe1syE7sYdo20vRq1eavkjBboSLREXelRSt4qNDUdUG8OJhzdK7GqGyYqtQxhNmDkNt9pbyuQbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Crp8t6oF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Crp8t6oF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F270B1F00A3D;
	Wed,  9 Sep 2026 10:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788949567;
	bh=V9QbkFr2uJsAHapRHti1dxgSBtGqP3Nr/414tjaVIM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Crp8t6oFhN9pa3/GHb0Z0DtpK/n2fJBiiTlqVMMYkx8CdXHBmvdoHAYxjXobBF1Us
	 jMbEWvDR+hmZi+Itxof+ATrOfCZUf9fCXCp8kDtEkB+LLX/PzdVSzg8mparsibLPvi
	 3e7l+n3iEHFKhop+A2Gpf1GMSTmXgZb66NuA1P5WkT4oTvexCTd/m+yiYEH6nomo40
	 bZ1+jeHsLucg6bL6vkX4489hEtxNRTD7EA/zEEiTAiUrE6kpE3hwV5m60AUgAs2gLv
	 kO6VlmmhWbZ/NDtjFY/Pe/4INVPcV2go14uXesZhx3F+tMKZCxyP7MSa4Hx7ZckiVo
	 0EbjiW69qJESA==
Date: Wed, 9 Sep 2026 12:25:59 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Hawi and Maili MPSS as SM8650 fallback
Message-ID: <3mas7v44ln4buz5uf7zp7aicq4vr662s5kfi3w3f76ihjhfz3v@4lq6jmp4zp5s>
References: <20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com>
 <20260805132129.2713174-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260805132129.2713174-2-mukesh.ojha@oss.qualcomm.com>

On Wed, Aug 05, 2026 at 06:51:27PM +0530, Mukesh Ojha wrote:
> The Hawi and Maili MPSS blocks are fully compatible with the SM8650 MPSS
> with identical interrupt, memory-region, and power-domain topologies, so
> they should ideally fall back to the SM8650 compatible.
> 
> Introduce a fallback items block that pairs qcom,hawi-mpss-pas and
> qcom,maili-mpss-pas with qcom,sm8650-mpss-pas. Switch the mpss
> memory-region and power-domain allOf blocks from enum: to contains: so the
> constraints apply whether the compatible appears in the standalone form or
> as part of a fallback array.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
