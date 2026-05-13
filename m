Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2421B6D1A;
	Wed, 13 May 2026 23:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778714453; cv=none; b=gPJ7NSLltZOYgq6xbsoqVC8xIpEv5/01zXmQMXM7aKZEKLmmWBAtWoBUXdr7wZUz6tI1EJtcR3j3ilhWPVnhup86oegkO8cJxLbL9X5VfcpBSSiIbw1nzQWF1SHHhv5fz/FFUy/J/Ub2nCw1DtHxqFgTYGDZ86hWGYIA6FVKURw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778714453; c=relaxed/simple;
	bh=c6gVBzt8AVFa29SE8vDWzNDvwT6lCRf93CNdGA0gfv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bit+Eqf+BCmR6LU7P385y08Cawwe5VN9bVFEA7Urc8cjw1tBovQwj8A6Ezj9SzmietO0QxtxzR8XBPPf/TGIfYqTITb4jQxaEeU+AS7aoyg6PUwmFx7r3Y3/JyeIzeiSPmO9WYkUPmbxils9cTUcHzeqvXusrXHG2c9/EGwlUjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uS2gRe/r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uS2gRe/r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5852BC19425;
	Wed, 13 May 2026 23:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778714452;
	bh=c6gVBzt8AVFa29SE8vDWzNDvwT6lCRf93CNdGA0gfv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uS2gRe/rwUgB1oLpI6VreCqlHeG2czx+FXS9Oy+Ahj/6tsLEOW5PnDc713irZ3ouH
	 I93wn5s2tvUjaJSv0/qhqD2EK04M4YysCzapnCbvuCNTvLHOzeUKRS2xBi022B6ucJ
	 dXBlgi5k2vQiNt54H9FHgoepf3iYymDrKUe0NeFu6ep+5QSGVDDng3WnbPqg+GW6Xp
	 QQ71rWplU+vUm7X05iJUREsUnRBdARsZ18jpycs3YkCoarHStLMPX7Da6HHDDBlpBF
	 xMKYkEjIp3p49lty3Y/N4hiAHAvWHzjBIW7M9U2qnUGUE4lA6RN/h1VF7ZWX8xQrz/
	 1EMWQqUgpnVOQ==
Date: Wed, 13 May 2026 18:20:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andy Gross <agross@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: mailbox: qcom: Add Shikra APCS
 compatible
Message-ID: <177871444874.2292221.6749801974684359180.robh@kernel.org>
References: <20260508-shikra_mailbox_and_rpm_changes-v3-0-698f8e5fb339@oss.qualcomm.com>
 <20260508-shikra_mailbox_and_rpm_changes-v3-3-698f8e5fb339@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508-shikra_mailbox_and_rpm_changes-v3-3-698f8e5fb339@oss.qualcomm.com>


On Fri, 08 May 2026 16:10:48 +0530, Sneh Mankad wrote:
> From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> 
> Add compatible for the Qualcomm Shikra APCS block.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

