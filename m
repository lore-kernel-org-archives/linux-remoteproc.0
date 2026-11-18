Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795037505;
	b=Lt9kIDRBS6BzuHr2TOT2fXBZxJugrnd51WKaJQBT8O+IYFfZJa7tBMDuu2mDCKHhwHV2
	 6s3L9VCQn20tMViHogAv3R600dNvMZd9fCM+WZzrQvt47iP+/BozQMEYKaN5ZDbSNZdG1
	 dlb3dKXzSJl4gXBgWJCMr3z8A3clH6ROxVJrDbhpUCQ3CchqDauInB5+OdQ+xJDTY/VAV
	 /PtS4TyUo3Z0Z8ILlI/OpTMcXcjwG/YvSF+6Z6WWTji2TM4Xy2y9eZEMLhDCNPjBy/jue
	 djPfZjGKLatkLPNv2P+45cIu+fAdsxzXohgiyTwKLSVPlZoFCHSrrFSyewdz3C0ei0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795037505;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mdkhViCmxHPHXtPAzeJjBMbiylUhANODZG9eH04+n2k=;
	b=db6oSK9S0laOyHzcQ5ht6KKdQbvPrFbTbtZ6uwhJ1s3mH+kefgBh8mgNtnKYEkOdqUG5
	 uPg/F7kA4ARmHJnT+oC7GUmwj7gG/4ljZLdmy5cmTJa+E7RupenyA/MasNtXRt0NTZjzs
	 RjKCp8Nc9vnwq9J5057G52vL+ljUoCh4lbkQe8qZEWyKNAefE7l2cYh8oTVcMbzRL6rWu
	 WQ7gcusifWp+NGqnyMYl0t4pcxt6km7uPowQZFx5+hCEgvDUJeGxYSK1FCCnxTcvwjnSL
	 Cyaj+l5/ipsLdns82ED3EA/oqUlzcVxXJ0dr3A1nKDufMfaphkx5xLGlpFe/JxvpOvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f1fT7cjh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC2A606A32A;
	Wed, 18 Nov 2026 21:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f1fT7cjh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0961F000C6;
	Wed, 18 Nov 2026 21:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795037505;
	bh=mdkhViCmxHPHXtPAzeJjBMbiylUhANODZG9eH04+n2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f1fT7cjhk+5dNPB0HxhpbrfQFDRbFCM/NQnTblXNfdI1K7GSA1cQT7O1dE4OtyynP
	 p3uF3KdgGG51lale/hPw1glbT2Ail6zoLLAcl2PDMQGibHDa+xLxlryyRkT6XRFL2I
	 Z+4pyCGA/sPI2Wln20kXmD8WUCeWSWQtux/2ksJuAdG0loaRgyYi/wwhrItj/0ppu5
	 4UX1TWtgXU3ruGPaYJT0w53X/X6A0la6V38Hg4P/HsKFVtkOyYN8B94t13AdcrWAxt
	 G914L6OoQydGHLnAWCi7zYau88yuvfTxW3Vdn8fxhADJw3BOdweUIeeJND4rz3frcn
	 5i8KNXFE3lMgQ==
Date: Wed, 18 Nov 2026 15:31:42 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, phone-devel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Richard Acayan <mailingradian@gmail.com>,
	linux-arm-msm@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
	devicetree@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-remoteproc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org, Miro Mraz <mraz.miro@seznam.cz>,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: remoteproc: qcom,msm8996-mss-pil:
 Document google,require-socinfo
Message-ID: <179503750248.1112860.10353200603959842423.robh@kernel.org>
References: <20261116-modemsmem-v3-0-24ebc7ed6eb9@ixit.cz>
 <20261116-modemsmem-v3-1-24ebc7ed6eb9@ixit.cz>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-modemsmem-v3-1-24ebc7ed6eb9@ixit.cz>


On Mon, 16 Nov 2026 16:50:43 +0100, David Heidelberg wrote:
> The modem firmware on Google Pixel boards (Pixel 3 through Pixel 5a)
> expects the application processor to publish the SoC platform type,
> subtype and revision in the first vendor-reserved SMEM item before the
> modem is started. Represent that requirement as a boolean property on
> the MSS remoteproc node so the MSS driver can publish the data before
> booting the modem, instead of carrying a separate node and driver for
> it.
> 
> This patch was written with assistance from a large language model.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../devicetree/bindings/remoteproc/qcom,msm8996-mss-pil.yaml     | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

