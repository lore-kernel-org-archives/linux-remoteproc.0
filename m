Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9857138888E;
	Wed, 24 Jun 2026 06:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782282947; cv=none; b=jw9HM/dPREFAkZDywdrgMZQ4fxaptQVk8Xj/p3tw2haf3xKn/0YE3rep6H1ZBZ9lXIn2JwXt6LoMZT/lDftJq7/+z6jYzXT6oxFQtgHpeEXlJATwjENoHjiQd4nUegnP6EjwUfH2GiGiKzLoFgwpJ4iGZDdKVBxjPMkMKDnoQVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782282947; c=relaxed/simple;
	bh=hnVKMhY2BVYc+cQ14fmM/CYvjPjEY+o419up8PN8i9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bseBmttHCngrfZLHwDCmf3Y+A0TbaT3lGNQNxL98/rfoX7EnPdWfo6DIuZL+3hByVzLRfSC912aRHgu0uSjWvLmEa+9Nw60L1zLdU73M4+GmOBjcNTKIdzuXAazYVd34992osJzNip1RMzGc5Cw0SCdq8zWdlai91gjsajhpUa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LOlLePsU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LOlLePsU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7805B1F000E9;
	Wed, 24 Jun 2026 06:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782282946;
	bh=4JndaUv0XMl810tXFwMuRvcee+tipt/pSZDJa540npw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LOlLePsU0lXjcAzsjIKZ/xqYP3yEZRuzcqeBDer3sqfou9rkmSBzQy1GTPr8Vk4cl
	 /6oUjNDfgSy2G9DmxszD0i1YXxIxM0Ki78f0YAkPZhdyfG19o5NElBVcoQrP0Sizvp
	 f8EpvjXDnSzEVoKeqLSI7tw2CGFkY3z+eMf/HQdZIPUe6PNeQ5/3k9CAulM0YFyInk
	 f+orVLjsgzH7LRsbeuT9ven4hO/t9stqaH5qcR0JWFz0QBOMPvxYVeCUBd0drZhdHp
	 wBEfTLdJ2FRwuxxORA8diUVXcxmHJlhcLnKoT+XXbF+bE/MtybKq1VJfTRHYCoHPpu
	 iO24ArMf3aRvg==
Date: Wed, 24 Jun 2026 08:35:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kumar Patro <bibek.patro@oss.qualcomm.com>, 
	Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, 
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/6] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Kaanapali and Glymur platforms
Message-ID: <20260624-lush-sapphire-hound-71bec5@quoll>
References: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
 <20260623-knp-soccp-v7-3-1ec7bb5c9fec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623-knp-soccp-v7-3-1ec7bb5c9fec@oss.qualcomm.com>

On Tue, Jun 23, 2026 at 03:05:19AM -0700, Jingyi Wang wrote:
> Document the component used to boot SoCCP on Kaanapali SoC and add
> compatible for Glymur SoCCP which could fallback to Kaanapali. Extend
> the "qcom,smem-states", "qcom,smem-state-names" in the pas-common
> and add maxItems constraints for SMEM properties in the documents
> that reference to pas-common.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

