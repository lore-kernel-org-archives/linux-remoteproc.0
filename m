Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5D31DF73A;
	Fri, 22 May 2026 06:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779431561; cv=none; b=u5GnA9b60KDbP35IGWKehno+NwRj0OsaAmehJSx8qMxs4E6paSR6gexDLd6xclPU6D9YjG4uGlb8FeI/RLAcHIWyeyXt7qCTssrqg+N4URV77paeYKa2Y4kJHrJLh8heGcA8eopCYLVQAr8mPRsXQYnDZU/lUYojdjp6+qEsqqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779431561; c=relaxed/simple;
	bh=hhw1iwzqHPebr8h8OrEOAb3a4MvQ+w3rLcybElOIaaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m2qMgQjNKwjufQGPaX4cohAZ6bvaCzZuubQRrvtwzm5UgutDGY7TeDfcrvDPL+CJil3aKde6a/JW3jQ0SeKNWito0T57t45RnbeB/uMJ8GP66ppyrezao9nl7kIMAnp727oS6MxNpwebbvjJU4SVDiy9O5EFxCSqqHQwOsildOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NWusDrkJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NWusDrkJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B23A51F000E9;
	Fri, 22 May 2026 06:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779431560;
	bh=hppHeyHOJksZUfYDFIRGII3QlauFrwPlMGfG2ltp+NI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NWusDrkJLqji20MOhcN6avCpRrGpWtBCHDsbAQvVwYBriNTR0Vu+wwZgkdAVxkSWy
	 l7HH32qdhom7w3NdFIo6U06emGZWHGPsKO5qP05KEDPFXJ3IUWztXZQg7N1tIUdwe6
	 x4D7X+75Fk83iDFQ1fRfUc6N/ZJ2gwvwyjJEEFiYUnT0geLP0drL2otRjHOoVWDpgg
	 xfRsPeyzYk+KElc8p729g21mWkBqQ1UbccpBr71wfLWlTwtcbar7AtYSNTTTb6oJFJ
	 GZo/nKqeC6XBap3e45cpbQZr5kcOmenYleYXpzeYbXHsVohRqdE/4LmIH5DAp0IzKQ
	 VmBcqBYGC87qA==
Date: Fri, 22 May 2026 08:32:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: remoteproc: qcom,shikra-pas:
 Document Shikra PAS remoteprocs
Message-ID: <20260522-enthusiastic-burgundy-shrew-548ba9@quoll>
References: <20260521-shikra-rproc-v3-0-2fca0bbe1ad7@oss.qualcomm.com>
 <20260521-shikra-rproc-v3-1-2fca0bbe1ad7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521-shikra-rproc-v3-1-2fca0bbe1ad7@oss.qualcomm.com>

On Thu, May 21, 2026 at 06:51:37PM +0530, Komal Bajaj wrote:
> Document the bindings for the CDSP, LPAICP and MPSS PAS on
> the Shikra SoC.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  .../bindings/remoteproc/qcom,shikra-pas.yaml       | 167 +++++++++++++++++++++
>  1 file changed, 167 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

