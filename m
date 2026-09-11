Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F01D356744;
	Fri, 11 Sep 2026 04:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789102123; cv=none; b=kmwVd4k35CZ5KObYqafJH2MHPYmABVa7F6AYZ7UjTHOKFZCuIGS/WPSn8rbin5ZLGDHDjHzrYVTNVfx53dc6UESocZmZzPZcvfewmiRU9BJ6N3tDYejZ6biEAmxVLJNB27nFzY+mrFDagQwixy1G5gZAQlyLjomHXuFokmwAJwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789102123; c=relaxed/simple;
	bh=xpNWKFpSH5VCnkaKxbI2BsnUqQtG/D5zDfXSE9IQ23Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=svzTsizZlAebPF+AYz2lsWQHeCC/KZvt+0TVhuDRz91NQJgx/B/DrDrYhNjVPVras7H05HvoqBMXBy1jMi1Tz69Lg9RkanCdBVMrLgNnuFusikrqqolwbkolH/GPMsOneLIJB8PAh0lFLr/urQEc2UmYdidPDzay2hCyoYFEEoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NI349AAc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NI349AAc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DEFD1F000FF;
	Fri, 11 Sep 2026 04:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789102121;
	bh=RaXFWVIpvAkOv1rcgY9dD8QXcM4oemFc0hyj3zavRUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NI349AAc/ODtnuILo5pX58UGJTDu1tN53uvlC/rIvS+tAkKqxzP34A2l+WGFi1QAL
	 pwmrad245PjqAVsTM7A1UmFgvpmloSc0oBAoPo+hDmmZixO+OWEt5yrgR7cK/+3DDP
	 QZXDAoWqVk+esncXCVqHD2QmyyrCtoe8EHSzGn9ggbcgG14BJgy1cZqivZvdkFycW2
	 gVOpanlG2hvH+ocO1OZ3v3ruWemtYk7jzQMkXOAT2ZtrzkJvyD4I76Q9yC6ZH3nAaE
	 JbkxJxXpFdcQtX9dyHUp98ge7ThUUmmHXQ1tcVeAGQvqOjgRuTYTpMwXZJX0cDcAkB
	 EbZHkZeauoF/g==
Date: Fri, 11 Sep 2026 06:48:34 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: make
 qcom,hawi-cdsp-pas standalone
Message-ID: <nfhfmzqpdvv5uebpt32yjsg3tmdkvgn3awpmjg7bafx5vbyju4@7rvn6e5rzsp5>
References: <20260910150638.3270162-1-mukesh.ojha@oss.qualcomm.com>
 <20260910150638.3270162-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260910150638.3270162-2-mukesh.ojha@oss.qualcomm.com>

On Thu, Sep 10, 2026 at 08:36:37PM +0530, Mukesh Ojha wrote:
> qcom,hawi-cdsp-pas was initially grouped as a fallback to
> qcom,sm8550-cdsp-pas on the assumption of hardware-level compatibility.
> Bringup revealed that the NSP proxy power domain on Hawi requires a
> specific RPMH performance level that the sm8550 driver data does not
> provide, breaking the compatibility contract the fallback string implies.
> Maili CDSP shares the same NSP power domain topology as Hawi and must
> fall back to qcom,hawi-cdsp-pas rather than qcom,sm8550-cdsp-pas to
> inherit the correct cx/mxc/nsp power-domain constraint.
> 
> Remove qcom,hawi-cdsp-pas from the sm8550-cdsp-pas fallback items block,
> add it to the standalone compatible enum, and extend the existing
> cx/mxc/nsp power-domain constraint to cover it explicitly. Move
> qcom,maili-cdsp-pas from the sm8550-cdsp-pas fallback to a new
> hawi-cdsp-pas fallback items block; it is covered by the hawi
> cx/mxc/nsp constraint implicitly via the contains check.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
