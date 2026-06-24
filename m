Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1B224113D;
	Wed, 24 Jun 2026 06:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782282795; cv=none; b=pWWN1omvkTqoeWqw6nA7PJOrYt5TfzKMfvW7yuUVMVqdiLYr4yl5vF5gsXI1b7uUC5P34ERPwgv4lOKF7G8fYu5vCFrJOs7U6CMmJkTNxprGV2H0mlA+gv+P9WMd5sjZkoWPdCRgRXu6LPehvU4sT4PJxW24zRc48Zz93jTNbXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782282795; c=relaxed/simple;
	bh=dLnd+Wbfy4SW4UN9Emy4MvJ2CunNk5063uskrvzLphE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDg5WKMfew+Av0eaU24VL0D8yX8PGb+TT3Yhs9V4+VvJOPXISmLlHFBLW8u6m2zAavJdPwAKsyCeVSIHMO8v5a0rSZYcifixKaDVtqu2akghO6R/H9QtVvDlqTq2BKSbsvHdqQaIb1qCg7AyvYyXDvxJkPIe/MfWkFEzbaNXz3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mi1zcSBl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mi1zcSBl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80CAD1F000E9;
	Wed, 24 Jun 2026 06:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782282794;
	bh=YTzmz7s4sgU/DkI7GovlLvowhAIO6Ancu8TmZ2NG5Nw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mi1zcSBlnZwj/ho4otdLBksbLvYcKwmHRmkUnAwZHxVxq8TTR+cRR4xV1R4dlY7fa
	 KYHnPNdu5s0QalZsV1NRpnOlsxhENlz4OLWzdiq5n9+PRvNTh/rX5Yt3F3T3cyHmkN
	 Jo4LxlRUhVlq/AllvTTA/e2zaG/oEusiw8T9CL+7+6kiMuYyoxgN3jVi1nVTvfmn3d
	 nxb2p4vOtN6fS1IfW+dZeRHHFtpJaiAl+pMdjREh9dSKdw0yB+BcOQOMNn3odYVtjx
	 zbwFFEnNrrKC9aDoV244BVuF3Pz8OlOHBnDGWoZcWj/ei3/zivrCnFlUHxSMJjckhB
	 7Y0vN84WlZbhw==
Date: Wed, 24 Jun 2026 08:33:10 +0200
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
Subject: Re: [PATCH v7 2/6] dt-bindings: remoteproc: qcom: move interrupts
 and interrupt-names list out of pas-common
Message-ID: <20260624-alluring-fast-silkworm-4da65d@quoll>
References: <20260623-knp-soccp-v7-0-1ec7bb5c9fec@oss.qualcomm.com>
 <20260623-knp-soccp-v7-2-1ec7bb5c9fec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260623-knp-soccp-v7-2-1ec7bb5c9fec@oss.qualcomm.com>

On Tue, Jun 23, 2026 at 03:05:18AM -0700, Jingyi Wang wrote:
> Move interrupts and interrupt-names list out of pas-common since they
> will be redefined differently for Kaanapali SoCCP.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

