Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D6E3587DE;
	Sat, 17 Oct 2026 17:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792256898; cv=none; b=fxhS2gLE4wrntuTk/edLWYn3Tifgmpl7M0H0XZ78jdPKdzSDQh2WzhnoNFGTz4Sqhu0yCfs15R+U4X/WChyOlcpKwpFqsNheaFCb5dET8X2wEx+mO/E+VMcFKaHD484q7UnqPXl7v4nA0WFLebWMAY8pcGeoI9OnjUEXzOl1AGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792256898; c=relaxed/simple;
	bh=OMxdeZUjP6zP0sSvPjdTNL0pl15lOttWQgDacCAqqM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dvyF4LM6XBXC/9/SzMX72ryjxXtp5CAyfxp5RarM/0Wnuq4LvqtRPvjtmYHK/kGMs+FeaFSvNs/QyR65f7AroDYLMwrDJlCYTktc4UuzS5KUS5bvbjWnOZfgHs1Jw15MooLQRbD8A7AnbXuqXEzRmexiH0OGCKGtV53qtFz4Vgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d9rU0y09; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d9rU0y09"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365681F000C4;
	Sat, 17 Oct 2026 17:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792256897;
	bh=iLyKiZR0d3rZiPnORSR+KqFLY9HOg/qc0fNbf89HC08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d9rU0y095AiCmxKrprTz8w2NQ6dr5NF4V0yKviEpmsIdtn/c35oBurNPuWD88iHLZ
	 MMaWBRhXmzMQJcUVMSpzP+4FXrl/q1LGfgf3H3AJTurdQuwjnmk2neV6RLTL6agwGM
	 sVWo+ZTe3fjKjNM55FUbdkrrQqfsRpE1zFkVdzfXm7F8Znizk60JDNZpYhj4z+/ZQq
	 TsNrJtJROUPtya4i18HoW3sOZb4XIilCzW792FfhKmez1Jb+/A4Y3ww3cL2c2T8Zao
	 1y2BT7Ifah9UKaPh+SayTDViXU2cvK/Za1NUxNglABKM3dLilrV+jMJFCWIJ+JJgNo
	 RuZkhpL21Qi8Q==
Date: Sat, 17 Oct 2026 19:08:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ishu Brar <patches@brar.si>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Add SM7250 ADSP support
Message-ID: <20261017-powerful-succinct-gorilla-d0f4b1@quoll>
References: <20261016-adsp-sm7250-v1-0-2f39ac1f0496@brar.si>
 <20261016-adsp-sm7250-v1-2-2f39ac1f0496@brar.si>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016-adsp-sm7250-v1-2-2f39ac1f0496@brar.si>

On Fri, Oct 16, 2026 at 01:50:19PM +0530, Ishu Brar wrote:
> The SM7250 ADSP uses the same PAS ID, crash reason SMEM item, SSR/sysmon
> names and proxy power domains as the SM6350 one, so reuse its resource.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 2e1e39826..365f4fa5b 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -2046,6 +2046,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
>  	{ .compatible = "qcom,sm6375-adsp-pas", .data = &sm6350_adsp_resource },
>  	{ .compatible = "qcom,sm6375-cdsp-pas", .data = &sm8150_cdsp_resource },
>  	{ .compatible = "qcom,sm6375-mpss-pas", .data = &sm6375_mpss_resource },
> +	{ .compatible = "qcom,sm7250-adsp-pas", .data = &sm6350_adsp_resource },

This actually suggests devices are compatible, so should be expressed
with fallback and this is not necessary.

Best regards,
Krzysztof

