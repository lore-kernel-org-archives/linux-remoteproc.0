Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E646435EC0;
	Wed, 12 Aug 2026 12:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786538823; cv=none; b=JLU+lYWcJkxHbqHqmntJYGiFLk/AAIi9FiltUzoxbeVJni0k5fb96NKCNi1jgqERu+HzHiFNJhVTYM/+NwrzSsI5fsn5bJGTO7aRAqtFnmESQcUjeIRZKxU9jaqrFBp0wqk7LdRGyoKTYiEiuXdIGgh7KAT+nofPngPVo+BcvMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786538823; c=relaxed/simple;
	bh=/1gCcYS9jQxBAqx9/KrdFEM8ee1fsPYETu3Wl7YWH3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fQM1VUJwbdqrg/wlOrJEaBShJgNqxmgAzPkslHBJ+GHJbRR2B/k5K9LyHSn5kgwJrd/sIe0uvF1QBTo4ZkuNJlC1Nlit3QczO7/trWmZTOylqNBNs04fZa256JFHKfgMZ7ChGdg0llM0LZeyKTyQ3oITfTYNKK8rwrfaCKr4wts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zamo3PZJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zamo3PZJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B31E1F00A3A;
	Wed, 12 Aug 2026 12:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786538820;
	bh=1PIOuw+u+GM/VL7vWozisWkS995Zi/eskMy3T8ZRwc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zamo3PZJQEh+M80oYPuGFMTPEEEtqsacYn3fb9ohMZMB83LDvnfUVGVqQsRa8gV4J
	 /32qZXSd6TMF5h+uVO03bIn5Rsd1WDdtfLY82tmSYJgbS9XGZsa+UPrMjyJY9ckVZ9
	 C409uDAAXGj7KAV+Szt+8GVas7PeR1N0cxiseBfhvOz+/W+E/V3VQXS+79dhVVpvDp
	 XwGXCA4F4CER9V1wM3puv9SMSNrg2E87d7PAbtF74ivwdWjTjdUVeztTmcvfHbX30p
	 ez3+UoebVBwexC3+/lZ6FV8M5ff7uC6G5Wr2iDV1SKX0IT8vBLcNeHHLqGdbiKwnyG
	 N+nrZ+mAmfhdw==
Date: Wed, 12 Aug 2026 14:46:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Hawi and Maili MPSS as SM8650 fallback
Message-ID: <20260812-optimistic-wonderful-adder-96ffce@quoll>
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
> ---
>  .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 23 ++++++++++++-------
>  1 file changed, 15 insertions(+), 8 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

