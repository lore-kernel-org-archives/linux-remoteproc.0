Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E829238B152;
	Mon,  4 May 2026 09:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777888657; cv=none; b=k07ftv7GlaZ+v5+zWEFxrRKstf+rZ6CXdLSeRd/VfvQegGY+ruT8TJgw5mpcMT4Z/0sa3fee348uRWfKo4h+13RM/Z0l+q3kTNQ1VlMiPZ7aGmwnfvg8Obcoszg4/qqg0+GL0hBxU9az1jmhVDx/uiKefxmLLhgwqKhWDWouG48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777888657; c=relaxed/simple;
	bh=gWtRL0z1lfZQV7Rh+l6QZ1KlE0Mjecys7YF6kaVtkPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iALNDisYiFGluDQQPJgFvHCWYJwq3DFivcnk88r/YHIrST2gnMMrzE4udtUTql/zmWyZfw6EvN2sIE54yn6XC366qSW3UBDMw8YcVZz2bq6ZZYb+npT5xelf68iGY2UN+x9JvmAxpHQuv51UxXyt7Fg/TClIjh9JZ7sxTQ8XBxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gq5E9uLT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gq5E9uLT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED89DC2BCB8;
	Mon,  4 May 2026 09:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777888656;
	bh=gWtRL0z1lfZQV7Rh+l6QZ1KlE0Mjecys7YF6kaVtkPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gq5E9uLTByFfwjtkK/sfUsox6TIjp8EvhIBAbD17sLpFX5SQVZm/bl2iaQxcS207E
	 rgMLJxKGFFKn+oO2HykQoI0nywLnY6S68xX0V/rutWjLduKwzmzkfC8wFxoyOG/9GW
	 lOtvldsFJiEX8f9/Hn2klssqmbW9+eUxixg88Z4SpVZethXMeVKo9WcGTHlWjGsm4/
	 Z/JDEkC9POTArgjOUcnl8I/ZG8MSPcB3aannrfZ/ec5AwvE0y0qpqp/EZtx5/hn0Oy
	 QRqxMmY2ctergtZX9s10NWvs5pjwvm3cv4KSbh+WJISNF6eGWhhNPD6hoPH+d01mwn
	 296NnQQmLdQkA==
Date: Mon, 4 May 2026 11:57:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Stephan Gerhold <stephan@gerhold.net>, Jassi Brar <jassisinghbrar@gmail.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Subject: Re: [PATCH 1/4] dt-bindings: soc: qcom: smd-rpm: Add Shikra rpm-smd
 compatible
Message-ID: <20260504-romantic-smilodon-of-unity-71d7ce@quoll>
References: <20260430-shikra_mailbox_and_rpm_changes-v1-0-61ad7c57ef27@oss.qualcomm.com>
 <20260430-shikra_mailbox_and_rpm_changes-v1-1-61ad7c57ef27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260430-shikra_mailbox_and_rpm_changes-v1-1-61ad7c57ef27@oss.qualcomm.com>

On Thu, Apr 30, 2026 at 03:14:56PM +0530, Sneh Mankad wrote:
> From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> 
> Add compatible for the Qualcomm Shikra rpm-smd device.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Folks, please organize your patches per subsystem, e.g. all SoC patches
in one patchset. I saw you sent separate firmware, separate cache,
separate sram and separate SoC ID.

I was already asking this.

Best regards,
Krzysztof

