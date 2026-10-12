Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621FE463B70;
	Mon, 12 Oct 2026 08:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795366; cv=none; b=L+EiURmdsIWS1G2AfFYnJJsdY6w52/AUkEbjan8CXzlbKcT2UzdIVICnwIHDGV2lFqxd6q0LRH0feZb2aJMn+greTy7gqyrzZCVsegIadt/e/aWljx+WSxTRxwx9jPZZ995XeR2DWhYTTWWZsHRqYUCJMsn5M3Nf7yBjQ0MGOiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795366; c=relaxed/simple;
	bh=B3r3Rsd1DjXukVLZFm3ug2ChYRc0qGNCIgGMCxG+DRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aiEKVtvYOJfPSOud1bouBEgUBldbqVFvgXTc8DqxGqIKblPEy81iFn0mCh5DpPZ6gx/0d5G0PbVhB8/E9mswx2xyJotxZIOgg4Auae3v88ZavTcfDLS/M7DVUFEelFHi9B/zq1v3Rbl8Qnj+ZX72zBv+XgmUDVjSTR0jrGQsr5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9j5M231; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9j5M231"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C101F0089B;
	Mon, 12 Oct 2026 08:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791795365;
	bh=uj4d6jl7sR597zcrY/Qqh705oU7CeU3jeBis8Gkrjrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A9j5M231aSHis95kha8TxE57mjP7z7Kg+fAh0fGw30eFd0MppKKyHoOuGFNgSadhT
	 yNw7dipDIlo1bAgqZ2LO6T23xNALg/cPxiXPOw/uQjCtm3Cr5LKgv1UPDxhUhKGI51
	 NVWqwJYQcK+xoDmtE5/nVCTgA868ZPUPgOrWOJc3sBE2MaSY4LN56E7aOlwNr3wWEv
	 SJWPltgHarZlXzhtp4h1uMduzg/YzYhLTzLBcoXplnO6ARJhBFZtWaWfsVxZ/qe0yK
	 zbpv0QH0iGhATXKnkInobay4RiuKdYZQu3M/e96zgSvap+kFWZ0C+tbCaZKpTRvXqX
	 K2BvSQFEYu6ZA==
Date: Mon, 12 Oct 2026 10:56:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS coredump
 support
Message-ID: <20261012-burrowing-tarsier-of-serenity-3bd5da@quoll>
References: <20261009-oob-support-glymur-v1-0-96cc8ffcced3@oss.qualcomm.com>
 <20261009-oob-support-glymur-v1-4-96cc8ffcced3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009-oob-support-glymur-v1-4-96cc8ffcced3@oss.qualcomm.com>

On Fri, Oct 09, 2026 at 12:47:42PM +0530, Anvesh Jain P wrote:
> Add coredump support for the secure and non-secure OOBMSS carveouts.
> Register fixed dump segments at probe time for attached-state recovery.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 85 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 77 insertions(+), 8 deletions(-)

Why is this separate from Glymur support? How is your device suppose to
work without this patch?

Best regards,
Krzysztof

