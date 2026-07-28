Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE523B2FFC;
	Tue, 28 Jul 2026 08:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785225620; cv=none; b=eBV7rF8keKjUuFI108ZcB89k3uEUGzflaLNRxMz5Q444EZ/J5wyoO5FrNdul0i8HU0rcNLaqmzvWpfPvD3X+slEue966Nf58nIp57YuAPptu0VC4f5KIqj18kBKo16rlD2ubXLiT15sdLocnwgLL5NM2P1vBcJQmZZfmkDadIyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785225620; c=relaxed/simple;
	bh=4A4aauv27aHqFvjCI7KEWnFTtcaRYA2aqNIh+5HA8iY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxriJkVkepQ5P//qAVeF6rKSi2CLnX/QVMgrM6WfvHLe69lBGAd69bZAUqPMwOysgH1FtZ3GBRlyCPDgolWdKNomfbfdd/Juf2trjb9QQZi/JN5bpjqyoSAfvTaQiWdMJAFAXGJOYT+SloQKW7kIcaYLvfpFLdw7ZQilq5OHLaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BkBEKWqU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BkBEKWqU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E3A1F000E9;
	Tue, 28 Jul 2026 08:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785225619;
	bh=7Hk/8OXEmDuITx4a9sbe6I8gnsC7YmpsixKOT0CxzjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BkBEKWqUVLiZV2KYppHzaJVD96kmaDF7sUkdNMcUeviN6j8XIA0Anr/GuOs8dtafA
	 aYFNxArswLDwosFiy2Jl6mIZ+ib7LNR19Klbf4UOsEoQcI0OZBgOaHX4YEC18VNUgA
	 AvnvFUcOWrMUcf4w8tdjZrhmVVBG/3cwVyHaHhvJTn6MzYj95ascdpFmhAxugLA9BI
	 Sbpl963fRlxbx0Bx/m75/7/hiteN+EEW5ugTz0b6x/CVrqYyH1qJ0rY1vgKX/MdaXr
	 AG/yFPpFd33kuKs3vf4S89L1s+DquUQv2WEzi2Xhmjep7ut1mStRv2DPSGmHKJvqvh
	 cineil9KU4fGg==
Date: Tue, 28 Jul 2026 10:00:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: remoteproc: qcom,nord-pas: Document
 Nord PAS
Message-ID: <20260728-expert-delicate-kagu-1a2c21@quoll>
References: <20260727074621.561661-1-shengchao.guo@oss.qualcomm.com>
 <20260727074621.561661-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260727074621.561661-3-shengchao.guo@oss.qualcomm.com>

On Mon, Jul 27, 2026 at 03:46:20PM +0800, Shawn Guo wrote:
> Add a dedicated binding for the Qualcomm Nord SoC PAS devices: ADSP
> and CDSPs. Nord ADSP uses CX and MX power domains while the CDSPs
> add an NSP domain on top of that.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  .../bindings/remoteproc/qcom,nord-pas.yaml    | 173 ++++++++++++++++++
>  1 file changed, 173 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

