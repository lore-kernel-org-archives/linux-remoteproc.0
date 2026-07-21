Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49AD400979;
	Tue, 21 Jul 2026 09:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784625776; cv=none; b=Ed8x0Yq84xF1A9yNqvoUSJcp+rMXFECu35SXydTTTllMteUkA/8IOqjtpsOAvreuXxrFAfk9GAqIfYTjSGlLUWZJhbxgWP8pVfTg/YvQi5J96b6tHNU+ecDxYtYPpJkTlqw6DuLmvsky8fSAM7+UOUeQX3DS1sLCmBiHbTpTtCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784625776; c=relaxed/simple;
	bh=Lu5keEFRDwqee3nCJAsX7LDBzrYe1RjtLunYjoaVNv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cb0kw912+LBJnkgj0pTHvYLlWTVMd658xlFwlxUHyDdHoH7V/CP87VFp5i6RbuvfGHLuKg/1VqWUClmYZHbDfvbkFQVoSK1oZ6QR3yr9r3BOqdw7LCwQ+1NhmVfrGdKgGx59AYX1jyP39KcN/MK45v6FmyTfPb97GrbYcS7s/0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CwVH6EZO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CwVH6EZO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73EF1F00A3A;
	Tue, 21 Jul 2026 09:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784625775;
	bh=+0fGWALh5ozcq728JJWZQDIb8rxjjGcKn/1h1M0KIHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CwVH6EZOdsQpumSciexncfSJ+Deogdm8dZ+1XDoFi/9raTHWV/0VTh/gCyBOO7lsZ
	 WSeI0gyqj3a6trSzCithf8pyV8W9kMqUn0W7hFGjT/aCvze+X9ou08UxrVrIdtg1pZ
	 AEzjVqm/fB3owPKMWBiWXrKYgBLhfbaM0zahlT3S5AEzFECJNO1UeeABpbYa+JxX7z
	 8JMnOZmhBwdAaMSm23O/XbiuanW3g59GXOPF9tGtYOEVyOdjXg1n9fZXWx87RLuGHE
	 tLchi5tFhFu+U2ViXEchudyw8YH6qvsRro2DRy1V/WTQ395aRYfXRlSmLF55hZSPmi
	 2TO2a3nXNlOMQ==
Date: Tue, 21 Jul 2026 11:22:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,milos-pas: Add Eliza
 CDSP compatible
Message-ID: <20260721-benevolent-wonderful-kakapo-ca8c2c@quoll>
References: <20260714-remoteproc-eliza-cdsp-v1-0-32eb7a1f2c59@oss.qualcomm.com>
 <20260714-remoteproc-eliza-cdsp-v1-1-32eb7a1f2c59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260714-remoteproc-eliza-cdsp-v1-1-32eb7a1f2c59@oss.qualcomm.com>

On Tue, Jul 14, 2026 at 03:24:01PM +0300, Abel Vesa wrote:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,eliza-cdsp-pas
> +    then:
> +      properties:
> +        power-domains:
> +          items:
> +            - description: CX power domain
> +            - description: MX power domain
> +            - description: NSP power domain
> +        power-domain-names:
> +          items:
> +            - const: cx
> +            - const: mx
> +            - const: nsp

No, do not grow the ifs. Eliza belongs to class of SM8750, so I don't
get why it was and it is being added here.

Best regards,
Krzysztof

