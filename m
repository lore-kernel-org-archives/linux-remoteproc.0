Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8C623BCF7;
	Tue, 10 Mar 2026 07:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773129054; cv=none; b=u6eLlMuKNIVj9j2WSvU4of7pK/8ZFY6L8OAhgbR4IhJjpcqod/UhAYksTM6HPN5mal+ntqe8MBxS8Q9MllRFgykbsjofkUegcSzxQ/x0DsmxiGF31bGf9llCxaxivijVaOB0HUtbix4pbBKMoLuFWEASjq2FUJ/QJdjqreACMFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773129054; c=relaxed/simple;
	bh=gWyeZKYSRMoppfmdm/ZYVybQqyIysryQCXmj5xwAHzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hq9ATABf7Jn3JInApNiIU+BP7GiOTiQgOYFjNnT087dKtP4fZ3xdfssCxUSRynvjmjlKK6JjF733EYJGs4Q0yX55v+nXj+gBe6uyw2tVf1OzWhG7MJlOlMV1eBsHSNYRyB01rRsiAKxKemmOXaxluToQnBMV59kXfpc7zM5XdL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dLDJ69JY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dLDJ69JY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AF9AC2BC87;
	Tue, 10 Mar 2026 07:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773129054;
	bh=gWyeZKYSRMoppfmdm/ZYVybQqyIysryQCXmj5xwAHzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dLDJ69JYF9SC0tkdqhwHhcxF+oI5XSMZ69+CIu1VJUAS9kCPgyXJ1mcwMXuPNetKW
	 JPZExzhyR8mD7Wo2H7ptln382wjK16iIFXMxxNqk9tO1ByiSqDhnAvOxUQ6zOwTR7y
	 UqYR1XsqlcVNMygwezpY4JkikhjdkN2cQN200ykwYC5I12/vmRzfM3h/m4nHBFV+6t
	 F45FUEenR8F8ikoPZxA1O6H+j6XIzOL9xTbWk5NJ4djKg2zq2LHcbIgs63u9YW1lKc
	 Rzes3H4ho53cYCoNEMFOQgI/vPLV8EmKlFEgZeX1jAxfBn/ukta0vZC4f0SNgAkmUW
	 hs/Asq597UTyw==
Date: Tue, 10 Mar 2026 08:50:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, mani@kernel.org
Subject: Re: [PATCH V4 1/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Glymur ADSP
Message-ID: <20260310-translucent-almond-herring-f7acae@quoll>
References: <20260310033617.3108675-1-sibi.sankar@oss.qualcomm.com>
 <20260310033617.3108675-2-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310033617.3108675-2-sibi.sankar@oss.qualcomm.com>

On Tue, Mar 10, 2026 at 09:06:13AM +0530, Sibi Sankar wrote:
> Document compatible for Qualcomm Glymur ADSP PAS which is fully
> compatible with Qualcomm Kaanapali ADSP PAS.

Kaanapali here...
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> index b117c82b057b..fb6e0b4f54e8 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> @@ -29,6 +29,7 @@ properties:
>            - qcom,x1e80100-cdsp-pas
>        - items:
>            - enum:
> +              - qcom,glymur-adsp-pas
>                - qcom,kaanapali-adsp-pas
>                - qcom,sm8750-adsp-pas
>            - const: qcom,sm8550-adsp-pas

but not here, so fully compatible with Kaanapali or SM8550?

Best regards,
Krzysztof

