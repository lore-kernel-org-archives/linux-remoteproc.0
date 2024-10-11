Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D610528E7
	for <linux-remoteproc@vger.kernel.org>; Fri, 11 Oct 2024 13:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728653758; cv=none; b=A69riJ07TsN+dcOSwK6fG/78KtzJAxcmBcKijoIfoEpqjsBxcNdOabok5Gb3toJZTCZq1qyjI/xzf4YzOWozDOTBx5cso/u+LQJr8vs8QJRfZkmkSLv1/5Hr1aJmgagTsKlvn53pSW6HyE7ENd78YgUooAWnGbTe1oBXiGD5gFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728653758; c=relaxed/simple;
	bh=OiPjQ8MyGaquQDLyi6YQldxdwNs2wiBntXh0rQOlR2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MxNdEkDjbrdxSEVqhu9c6hfCPTeEztEHGBdw+IsBZ5IqZ9JKfziCZh6BFGQKXNdx/UsDZOJHF5qb/lAtcaIaxsdsQc/9DZUr4xaiEefqrc+nypV8FOzx4RcBb5yXshu+M5EW9iaxmkjjnDPif1HyLIo73pJ/HNRsM+zGbw04wFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z0BWlzPG; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z0BWlzPG"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539983beb19so2464960e87.3
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Oct 2024 06:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728653754; x=1729258554; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lee9T2avC+D5UCI93ZOX/tuQVshXYhIDmaT3ML/ypgc=;
        b=z0BWlzPG3HnoqW88P3mSyqI+1tcuxJDfoQ4u1tSARQdKdCSjv0/6f/pr/ECKS3Gdjc
         EmIYbkahB1HT5kxjBD1PdreHwBRNw2E8YZCGeNsp13bkqFYGAWy+8/EXQYbIF28LRstp
         h7/jb8tdXijbEPJGxHowK9+QX2ryl1ToE9ZiuOgEcIgbJ/x6HPAWL1EtYmc3o9S91YB9
         cPxduth+ccBapVWd8BNTUPci3RnNZ+KmVMORR8C+Lt/7msPAMjPQz0OtEctWwK+7Z81n
         i7Xz7NGzhM1vT2/CWBGIM+UBkiodesppMVVteaMiSAtaSLudP8bXPiMDgIf3ZuSkrPwd
         nh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728653754; x=1729258554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lee9T2avC+D5UCI93ZOX/tuQVshXYhIDmaT3ML/ypgc=;
        b=saJUIdbhOBjODHHXyjaDj/elBmGBfwTeQ3bJjNldH2NM3WZRDRxye+gvZCKbPeQUTd
         yAVTSxgPI8ofHUq/WANpcBdGQD+XjeUECy0KvsutCrhyRalvhkUjWP0Gr1ij9NmVLLZv
         wRdJou5+oRbiRwETkhVWwenW1BvNtcDGl8Zy6fqFJfkUKdxTmouGzR+Q1fvElrzgDRUd
         /i/jK8mCiXnKaS6spuvDsEQRP8p1s2DEQpyzRLymRk/wdauUic3vMI/k5R9NVJblG1+i
         wMXhtkfPS+OUMSwzpNYIZ6iBdg231uu4yfYDSZAc3CKgfeRQigbaw2VCAn+ZRGyid4aW
         lzYA==
X-Forwarded-Encrypted: i=1; AJvYcCWx1Xxl2uA8fIw2lc0c3cvbLgmKo0F8HJsl8ivaDuqbq68HyFt3fmoDyAPJPiUlxYpYef//ayQFnaWDRsM9KD5f@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqdnah01mg6Xg8OshvmpLRpiiY+xtUhnbjo6GlYbKJJxHF/sOY
	TterF8HzbDXZA+Y8YBISn7Q+dkFzVIfEuNIUWSLkoG7Ax/nFE2teev/uyjC03sk=
X-Google-Smtp-Source: AGHT+IHgnh35xStpY2heWGmKZStShihyLmI1pL1o2CwQht4HKacsYK5EB3VbxRwl58nlG9lgbQbteQ==
X-Received: by 2002:a05:6512:114f:b0:535:6992:f2cb with SMTP id 2adb3069b0e04-539da586e45mr1410695e87.42.1728653754028;
        Fri, 11 Oct 2024 06:35:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539e2d5adc2sm84809e87.302.2024.10.11.06.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:35:53 -0700 (PDT)
Date: Fri, 11 Oct 2024 16:35:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 08/10] remoteproc: qcom_q6v5_pas: Simplify with
 dev_err_probe()
Message-ID: <qfeegspfgaxccc6zu6oyrhuhze2kejw6k46ovgea4557tlcnc4@gs2c2bgb2cpx>
References: <20241011-remote-proc-dev-err-probe-v1-0-5abb4fc61eca@linaro.org>
 <20241011-remote-proc-dev-err-probe-v1-8-5abb4fc61eca@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011-remote-proc-dev-err-probe-v1-8-5abb4fc61eca@linaro.org>

On Fri, Oct 11, 2024 at 03:09:16PM +0200, Krzysztof Kozlowski wrote:
> Use dev_err_probe() to make error and defer code handling simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
