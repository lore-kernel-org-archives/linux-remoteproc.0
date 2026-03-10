Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851DF28FFF6;
	Tue, 10 Mar 2026 07:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773129135; cv=none; b=RxqiBKLSDKzrgMbPgCW/muvUGoq8tLSnYy1Bfmo03aXTY7aG8qZSOWkD67upKFX07/9x9BGyZFrG4ij1GcnyZGj2BRb+80Nsh2f2rLJE6txOlds+QkziVueStjS2bHX84ZojlKsF1v4GZPbueWw8+/iew1SA782zwC0RSPEGcpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773129135; c=relaxed/simple;
	bh=dulypwfTkKTS5/5M3EF3v38DdZO+JOxzPujQsFax51g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7/9XBwthIfITftIpeXMdKsZa9mqrLZBdIO5bMUoJzQsaIf4JEui0vItj3lDynr9FTx3RIWaCZ9p3DmE7zSBcS5OK8CXXBlun7N/+ZxdZdWmK09FoOYZrCZavUtf/1zCg5gmKYUZeUUXEbKGIC4h/HI5kxjqpjktB5Xf41eFGok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l67Wv0Ll; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l67Wv0Ll"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 981B0C2BC86;
	Tue, 10 Mar 2026 07:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773129135;
	bh=dulypwfTkKTS5/5M3EF3v38DdZO+JOxzPujQsFax51g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l67Wv0LlDHR+CeoZreU/DUyoawNKHcoGUQ+DyueUj2O1wuGOEWRKUxZED8CX0XLcZ
	 hHSqGoycY2R1MpmzahXjsn2AZsJJThN14M7mh8sfgwWCPy8oJxCHmGvRD7zBcMwPnm
	 xo3i4zepO4QdLKthzJggcHhyUTIyBcwiKOB1AIQdn5CNme6ESVqkLTETxC6pUxudpK
	 Eln+0KS/v7G3WjhQUHQb+q/4A/SMAcXR5EM2L58yh65xaem2KQZRSOXMUuSzglk1XR
	 eSvln6Jug/SvoYnik6DRjQk8OeEotGfOLRziEeQGMjQd0LgWNPzqha00ZW9Wknhgvg
	 CSjHBNHwqe98g==
Date: Tue, 10 Mar 2026 08:52:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, mani@kernel.org
Subject: Re: [PATCH V4 3/5] dt-bindings: misc: qcom,fastrpc: Add compatible
 for Glymur
Message-ID: <20260310-happy-intrepid-mastiff-6d3e1d@quoll>
References: <20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com>
 <20260310033617.3108675-4-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310033617.3108675-4-sibi.sankar@oss.qualcomm.com>

On Tue, Mar 10, 2026 at 09:06:15AM +0530, Sibi Sankar wrote:
> Document compatible for Qualcomm Glymur fastrpc which is fully compatible
> with Qualcomm Kaanapali fastrpc.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/misc/qcom,fastrpc.yaml        | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

