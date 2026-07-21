Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E7C3AE18D;
	Tue, 21 Jul 2026 08:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622680; cv=none; b=CdpeL75fk/8HogOt37l4/bgJsp4whjxnrR8ZkxjmQwMvqtugYi3vZqNHsUXEUlfHUMf6Mmgu1ueh8R8zZaC6d3UX5hC2O0AAjNEF1dnFf7VbvDv4G4VUUVUaBh7Ngdb480zvx0UhVhPGxylcaoFz5hD9kr7TZ7sqxy/tyPyW2lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622680; c=relaxed/simple;
	bh=U0MuA4GDEeDELZUWCNkJqKt19jy22tTdM7e7AEUl3Ew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFNniy+mRFKDWZAVf9n6PvS+XmJNE+PwgbRD33nUsGanZgbcgj9HcQeSdEbBVRarp/quhpn6fikOHVA2GhfxFZ6EobbWyBg8x03F4hK5lqVRv9QwpQMggm/+SamYtFPJSVvm7Aeg3mcgCUmTvcT5vEzW9VnvZK0NZpU9pdHa3wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kn0aAjB7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kn0aAjB7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A8821F000E9;
	Tue, 21 Jul 2026 08:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784622679;
	bh=tt/a5l7nojCAhyhx8Y74MS70A+it8fEQA8LiYUPVWzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kn0aAjB7BLrwFsWe6ESRUVG7atxt6wcnb5UeTYZjqqB1rw2RWJgCJFUBzduF26XTp
	 HUVmsEs7/e0iDf9qA8EZD/PLX/40ggje3sH3ipO79eK2yd4OPeBDHeSQpql944cncz
	 lwqEd+J8UjSiNhlcr5YKc/8aHOXHQMl5FpqazWAooX9KAF5Xd/cD+AbjE1CrMTqM3y
	 mxBN0aDw5a9qASxHNrCu0nr3k/l9q4x1YTo9beMIchKxGQtahQ3UNrOItc9EveWw9R
	 sDAgvyRzM+eb/VhKIfeUPEShjXF9owMc075YuTT4jIiQQi7n15qYMuo391W9xp1k9T
	 6WSlthYQM4MVw==
Date: Tue, 21 Jul 2026 10:31:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: qcom,aoss-qmp: Document Nord AOSS
 side channel
Message-ID: <20260721-intrepid-umber-toucanet-bcff0c@quoll>
References: <20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com>
 <20260709085149.4072181-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260709085149.4072181-2-shengchao.guo@oss.qualcomm.com>

On Thu, Jul 09, 2026 at 04:51:47PM +0800, Shawn Guo wrote:
> Document Always-on Subsystem side channel on Qualcomm Nord SoC.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

