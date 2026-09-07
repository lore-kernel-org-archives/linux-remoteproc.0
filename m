Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4055C37106E;
	Mon,  7 Sep 2026 08:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768531; cv=none; b=FWWZXeNrgo2MgohkRTNF5ORy0hT+XYIcn9hK7EOeAW7/lkF8LFDD/bXJqSBm116ezMJwd9C7E1ra7UVmygjUiKKmiv8DKrT649uGxjnV0XdrsQ1UqasbDals+dg1q0RG1YBj0vBUnDgGg6IXrWLhSuwWjWMEsIpJob+YuaXZ7ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768531; c=relaxed/simple;
	bh=8oQbb5EihY34cwUfdqaJmUj7ZhS3UFyxpDseqeuXKFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fY+CC7ouRUAU/hKyAfuRK+DbMUpaJSqA6GNOxuJvyDxfdMo6XRa26AIy0KTQ9nOlPgzW0ukrhtkJHyQeArJFp+a0YcyCcYxs/VEXLuyrpyWg75ocrESJFJXEmchfdoXdZvrXQ4ArhI5KQfBaB9hrUNC3trYzHdCy/JPfLaZ0JV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJaeVTmp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJaeVTmp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74DB1F00A3A;
	Mon,  7 Sep 2026 08:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788768529;
	bh=8oQbb5EihY34cwUfdqaJmUj7ZhS3UFyxpDseqeuXKFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jJaeVTmpNzzKqJQFMpcMfZzxl1ZPdhFIetPgaZZzk5GsXaM8+7DkTO3phCU6lM948
	 Uk35iIQ95ZfHxK9IZxZ4G9/ohrtgCPU3D5xzVjyzbezizjspOmYbkQoYlq0Wg8knY1
	 /DA2PtpdLnaMVCHX3p0hmuCuEbTs0JnWhzeihFWgie0dBXsKMYjcECsMrp6SMyxe+A
	 vmS4QjGXx2s74Gxd8vD6oQ/QkgKYcUYxgf6x8TJO2JP+ixtmyb4B9dRwKPx+5TlC0f
	 UTaqwxZK73Nh+wezJRKYJnTgN2Dr63cGvmIzo6oVSExwPycLspjRLu1QltQorS/nhc
	 uisOvhYgHb0Sg==
Date: Mon, 7 Sep 2026 10:08:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: remoteproc: qcom,sm8550-pas: make
 qcom,hawi-cdsp-pas standalone
Message-ID: <20260907-economic-secret-kraken-9d4de7@quoll>
References: <20260902204334.2061226-1-mukesh.ojha@oss.qualcomm.com>
 <20260902204334.2061226-3-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260902204334.2061226-3-mukesh.ojha@oss.qualcomm.com>

On Thu, Sep 03, 2026 at 02:13:33AM +0530, Mukesh Ojha wrote:
> qcom,hawi-cdsp-pas was initially grouped as a fallback to
> qcom,sm8550-cdsp-pas on the assumption of hardware-level compatibility.
> Bringup revealed that the NSP proxy power domain on Hawi requires a
> specific RPMH performance level that the sm8550 driver data does not
> provide, breaking the compatibility contract the fallback string implies.

The actual OPP level is another DT property (required-opps), thus
difference here does not define whether devices are or are not
compatible.

Maybe you meant it is part of additional power domain? But that actually
still feels compatible, especially that device WAS working fine with
single power domain, right?

Best regards,
Krzysztof

