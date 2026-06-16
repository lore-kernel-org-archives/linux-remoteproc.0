Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD38335081;
	Tue, 16 Jun 2026 13:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617967; cv=none; b=Jiqwa2tRwXZ2M8sRRjl0fyvDlYbSYzs5zKlNOlRCP/pZlpgqfh/pHprLWf5rbY4zZRuW/LjobC+ZPFUUpa2kRiJa9sq2uNVPgqmFL74WVD7BpRLyBtmW0O3XBbzNWR9o3idTHBKRjLoZDdGvjdVS1kOrNL21gsWGBVvnFElRxWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617967; c=relaxed/simple;
	bh=g/s3I8fEbaD9UtcCin0NuVp0QdDR96dzv1oLtNEgtWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DwRrmK7YXx4wriqB8nl8yJggoftwk8eEenWsKQ0LsTMaJOS/kxGDcoFQwzeQ+R8IccovW7yz0GSeLIFc2wJ1vKR2oBpinPNF1CJqpuo+SlSV0XYl7GNttijdi1Tu5plGEnTAbFxpGp3D/x1B91eEp/PXJYecRmLrLgWfWghgbT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jgTrmwAC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jgTrmwAC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8A321F000E9;
	Tue, 16 Jun 2026 13:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781617965;
	bh=WlEPYhlhha14wrj3jA/9tHd88Da5ifSylk4wFd+Q0LY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jgTrmwACsXZNY1tIA7L1IY1S386FxipNGNTcgC8+JuNYQQpZCLLALOJo5e4bBnAjv
	 f+9TKsCM9KJPmbv2G0QqCRxoLta2p//0U29o22HqR0iU3bM6LxQVAV6IlHHSE75Nhx
	 lO745Bridad3uUD8nppQm8mbIJu4nhtaMSedlYJx6k3utI/7RskDxLApLFCimfKIxq
	 ravWOZa6r7LgzKhoR3kDstEb1+ix7izhMJOaut6dy2mwKpItZv3uSiAAoWPr5sYDNp
	 M2tX1/8hdMCZtaq0fBZFU1otjZ44jYOeHz2gDODtQvMVb1WbWr9o8OIkq4Cv0Klr16
	 Smr5p1ndxTgBg==
Date: Tue, 16 Jun 2026 08:52:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Qualcomm Maili ADSP and CDSP
Message-ID: <178161796214.2360769.2901290121329434344.robh@kernel.org>
References: <20260615-remoteproc-v1-1-67721b4b052a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-remoteproc-v1-1-67721b4b052a@oss.qualcomm.com>


On Mon, 15 Jun 2026 16:30:21 +0800, Yijie Yang wrote:
> Document compatible strings for the ADSP and CDSP Peripheral Authentication
> Services on the Qualcomm Maili SoC. Both are compatible with the Qualcomm
> SM8550 PAS and can fallback to SM8550 except for one additional interrupt
> ("shutdown-ack"). For CDSP, similar to Kaanapali, "global_sync_mem" is
> not managed by the kernel.
> 
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

