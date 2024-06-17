Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98F818C326
	for <linux-remoteproc@vger.kernel.org>; Mon, 17 Jun 2024 10:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718618550; cv=none; b=VQiUvIZPeH34FyXppFGd1ov7oMiyCGtIh1AiyZU4wrUj5Bb+zsExkJoQVlx8T12RaOIaucepKbHq9CIt7LoyeWRlRslTSKsVqoC654XDxj5HgQ8nGH7WbmYJ3tYlHaFZ//VF8yJ7wZPq+1Y8oa9XY9gHVTPhDpMwAT8cwPIxCA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718618550; c=relaxed/simple;
	bh=yTSkvQPeLcq+zIoeJ8bnkpUSp77IF3hUoXpLG/uRtng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TuZ9Ym+RHG3ULn0ir0cTQVu/mVe9JBONv6Q1NJMbmoXWzO9fI4lVQuIGTmonKQkJ+GNglZD0j/lQOHQqEMfNgkcROTw3+NcBKIXi+RCTmpPISpnQoSOFRtfB7Nn/fWP0T+3R/Dg2Y4I8RiSp6WI+ovywYBKFPJB6LUg0lrJ/jPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y9VscPbj; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y9VscPbj"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ebd95f136bso48156361fa.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Jun 2024 03:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718618547; x=1719223347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f2ZohGJxhqyAKmW/bgp93YikD8cmmnsvoaV72UHkdjc=;
        b=y9VscPbjMi/fnqhCrFfzg0GN94xIPUr7eLqbL06UY8unHGKKx8WRtv/fHmhtQf4xO1
         vDY9SXmXETGt7Bk5XKbY7Abb6J5pYV7JQqiWhAd/t2SA9gigXH4J3j5pi4b71RYIKZbl
         HdOdtzwL0clo/auEjoXSbFlYFg0oqMi8H885NOTeRaG37zdTPyncG16xIEG7Dw1PVMwL
         eEXzC5BVI0IMofBp5wEdD42TYcJpcl3t8UsMU5g/idk3nb/ri1QXO6LAVkZHODCeTgmR
         KPe34xjN7bM1QE117cSwcLgh/cVaugPAbq7KFfp7Mzj3LjWJm0MVlxPDESjJEyFKMAxA
         WSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718618547; x=1719223347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2ZohGJxhqyAKmW/bgp93YikD8cmmnsvoaV72UHkdjc=;
        b=bKNzlJIwG0NJQ5C6gt5wrng6dac/vZONsw/ylejvafKIKqIvV+EbZ498GFgl3JCz+Y
         AxBCPLN8AvICyf4O1BmbufVij/xNdKCyJW2a+L1gCguzFmx1vswktc6kYP8AzblH4BvK
         UBCkRRWCTkdUb/i3mV5Jm1Y6Vje5DUNa+MTJADQ1VeI5I+Duf5MosjFEvs6G3X9ZwIYh
         nRQXUqHqHYM9LhJHzHdfE3FORLR9Ke5WWtv4ym4DwldwjEgooy7FHioRPHzBvZXrrS1E
         mjvLfCbAO7f1graeGh4w9craLjLcW/adR5fVGgoPBz3c6YOO2zwbE3AV2zCNCYUT/5nX
         Klow==
X-Forwarded-Encrypted: i=1; AJvYcCUO5FSAKTXWK/FiE88/0i1ZWNuZe6c+vlFU1D4GqrZq3azboWrZUQZQJd+17yI+GuVmwbzThR6PDGEWUvvaz0hnWpdrCotGm36LEHLRBYG22A==
X-Gm-Message-State: AOJu0YyUv1UEz0iJvIEUhYWHQr0s3jeIvr0LlzQ3cD4hmZMo14lmSPTQ
	EdCY8+hqZz4d0RJ/560Y0OYhHrkkMiiqY3qbqHlVB0tDBAx3YwSaAoGf1stVD9w=
X-Google-Smtp-Source: AGHT+IEBuXxmUii3zvoMKDN3vhvyXR3JH4iWC3OMw6c36KutClASgeHJ87tvcDj0tZ1+CeAE74VzDQ==
X-Received: by 2002:a05:6512:2206:b0:52c:c156:15c5 with SMTP id 2adb3069b0e04-52cc1561638mr114653e87.41.1718618547080;
        Mon, 17 Jun 2024 03:02:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2872080sm1210511e87.181.2024.06.17.03.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 03:02:26 -0700 (PDT)
Date: Mon, 17 Jun 2024 13:02:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Naina Mehta <quic_nainmeht@quicinc.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@linaro.org, 
	manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sdx75-idp: enable MPSS
 remoteproc node
Message-ID: <gvrflsxzuliszkayegdlbzyvwc4fnm43zxw3nt5kdtj4h4q7sv@7fvnckbus4a5>
References: <20240617093428.3616194-1-quic_nainmeht@quicinc.com>
 <20240617093428.3616194-6-quic_nainmeht@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617093428.3616194-6-quic_nainmeht@quicinc.com>

On Mon, Jun 17, 2024 at 03:04:28PM GMT, Naina Mehta wrote:
> Enable MPSS remoteproc node on sdx75-idp platform.
> 
> Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sdx75-idp.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
