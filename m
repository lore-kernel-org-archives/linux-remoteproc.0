Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729CD379C3D;
	Tue, 21 Jul 2026 13:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784642156; cv=none; b=HhJgHG+/dYIZ9GpZh7TZoxsM8YKvGQbVm1Gf+DAVrWyL11goCe4n64ucMCVFZtHq2ijBoQsAOezRfnD14wMQCE/8v3qoKLqqgwj7l7fmqlLaJe/6x73/7j7DV0rwu/RwnotXuWYxFEW5gfH5pEdZJ0NdbYa/n+DXLarqbBSg20A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784642156; c=relaxed/simple;
	bh=+wBf5eHOIFwrRzVwG5kwJD1oEIN0F9imhUQE5yuPAmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bW6BcSsxx0zv3RxxzrlaZVX4QHbD98LWrTNpTIKstErckgWqeoj+MtYsR1d/M12jo340nuhTEnd1ZXkzZ9jacn9C+hkOOjO5K0Q52SLPCuWeNaS1Jyebhd1g9QS1O2H3NUTKdcqqyu5ZxCPoqPM51XSaLBMrI+CHFHkm8U9gpR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YBEsBYMd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YBEsBYMd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B5F1F00AC4;
	Tue, 21 Jul 2026 13:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784642155;
	bh=ouc56odzJhhOb6Xo9OtCS6edpVGI6oMyf2eOKqIPMRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YBEsBYMdJi0ARvR8p1Kw+B8NAYK5XxOp+PQ80ST+I4nbPFALB4oKcZ/+O9hJDN3cy
	 gXzV0beYLZgTbIstoRJk+re2qXT0hR1vTVbWa1tmoG3SrQbXScYOVWfng67wSk08Xe
	 Wyo3r7mn8h/8mgGItnbNcEXwwNcnUn9PbS28WceQwhSW8VznRHwqwgu8K9vlAlNH2M
	 sCf1qVL3HOnCZdzoRxitl7uauCRphmmh43CuAjyHc64PDjYgWLf27e9W3ANh0U5u4w
	 R3IhA7ylqzWNBmvkBAONh9J7Uk7oYxgFMnvzVCvL3630ZHCI5EDh9V0YChDW+IvEwN
	 llb2vZaeCFPHw==
Date: Tue, 21 Jul 2026 08:55:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, m-chawdhry@ti.com,
	Conor Dooley <conor+dt@kernel.org>, simona.toaca@nxp.com,
	goledhruva@gmail.com, Suman Anna <s-anna@ti.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, daniel.baluta@gmail.com
Subject: Re: [PATCH] dt-bindings: remoteproc: ti,wkup-m3: Convert to DT schema
Message-ID: <178464215364.3491143.7271634349061719317.robh@kernel.org>
References: <20260719-ti-wkup_m3-v1-1-848a95b401a5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260719-ti-wkup_m3-v1-1-848a95b401a5@gmail.com>


On Sun, 19 Jul 2026 23:36:41 +0530, Bhargav Joshi wrote:
> Convert Texas Instruments Wakeup M3 Remote Processor from text to Dt
> schema. Add optional resets and reset-names property which was missing
> from legacy binding. make ti,hwmods deprecated as it no longer needed,
> it is kept to support older board files without ti,sysc.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../bindings/remoteproc/ti,am3352-wkup-m3.yaml     | 89 ++++++++++++++++++++++
>  .../bindings/remoteproc/wkup_m3_rproc.txt          | 52 -------------
>  2 files changed, 89 insertions(+), 52 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

