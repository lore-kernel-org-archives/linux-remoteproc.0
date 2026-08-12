Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFE043E07D;
	Wed, 12 Aug 2026 12:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786539088; cv=none; b=E3Eju7IBsZ0n+F33zrYAZufZVDeJOwsQjCjq6yzpZlsqrw4QrcdYhLg/Ye535biGrdWRwaL3bndVduYz/G8QQX7cWdiixjmKw8bmA2pCBcEpHji6/C0GDqUK/qe6bJGgGF13qp4gStHtekBHVFQ06CsiKEFuldSP7lT7UFIp2OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786539088; c=relaxed/simple;
	bh=HqFMscA4OCIpEfg1U3aaOLFIkRZEgkywOumc4qJ0lpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h30npG/YUKqraEHnZQOh+6JTJenCWZW4FQk+MK7krLA+v2+/vS40uybgF5JJErOUTIle8Qjg5IU2BZKG7k+qQKUnAbC3bWqBiGzxlkoRmqayVj80Dwwca4fdjIa+pWpbdfCKGG1MdOCJzOUwpIRO9viBli2opmay3BN5XKbdEuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S9Kd5XGG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S9Kd5XGG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA0E1F000E9;
	Wed, 12 Aug 2026 12:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786539086;
	bh=4/7wzvKe7xeZAEZM7tQrn2l2n9V/Q0w2RSrNE6nXpWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S9Kd5XGG3TTyU0U3wqnAZbOowD0JNxB3rBhUTrdnJr/qwVPZGrWsm7JRE5Cgf8lGu
	 arnSdmpVyqWYFaq00E1v/N7yIGT/teMSdMRWZ8pRI6o265A/xLf0bOo0z20/xM9e9M
	 M2J48eLYimjix1pAG3IkcI6K/bJr2BFXjRuKfaHjjgZ/o8ki4Oh4DdMurxCAOQ0VgX
	 HnZTR8ShYMMyQ0eotz8n03SooybmotgEViZLqhSm4+fg2iAb0Ecjg2qr8y1r4lPU8t
	 6Epg1gEB2In4CRNMcHSoctXNs2/7FgLKOu/+pUnxHT4oHG9ty2CjsVrjp65N+6XkHv
	 7O+kMmDE17wcA==
Date: Wed, 12 Aug 2026 14:51:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sdx75: Use SM8650 MPSS as
 fallback compatible
Message-ID: <20260812-abiding-bouncy-phoenix-9dadf0@quoll>
References: <20260805132129.2713174-1-mukesh.ojha@oss.qualcomm.com>
 <20260805132129.2713174-4-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260805132129.2713174-4-mukesh.ojha@oss.qualcomm.com>

On Wed, Aug 05, 2026 at 06:51:29PM +0530, Mukesh Ojha wrote:
> Following the dt-bindings change that expresses the SDX75 MPSS PAS as
> a SM8650 MPSS fallback, list the SM8650 compatible alongside the
> SDX75 one so the node validates against the updated schema.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdx75.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

