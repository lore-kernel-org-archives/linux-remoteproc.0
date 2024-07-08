Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F37178C99
	for <linux-remoteproc@vger.kernel.org>; Mon,  8 Jul 2024 16:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720454768; cv=none; b=aABuRXtOmEFaRR9WAJx7YFDfuEUrJw7ReAzM+UT80+RbWnzNHUSbNJf3P/Jpqi9UBxsjY1cEpAyXk5wRD4ETqSBkaUrFuExdAhGekNYqF9jfkFeXTG1Ujz+8wv9qgTSkYJEbLT+7G/oiybWM5Uu5RL446CcKWBFCNLKyk/rRVpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720454768; c=relaxed/simple;
	bh=lGPmJeUaHAtXVao18UW/KktsnLKISywsTLBsKiL//kY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gx2K2UmnL9MowICs7rlO2LQ8xE3w+NMbmpzmwGawplpy3WrEN3MaD+XzeDusDbd2alC+05QneNttWRZr5RrWBMixBlDEDh5R9LDHBYGJaNZz7f+sh2gJrNT1JsytY4Ytbos81y2msHOO2xG4YCZEkyQxty8LRH6jOJBpVhsBp0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Loi3SDcF; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Loi3SDcF"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-70aec66c936so2697444b3a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 08 Jul 2024 09:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720454765; x=1721059565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3yotOwh1dtE5DgMK4jrp0VM5GfIPbQCVEmdEcJAa+qI=;
        b=Loi3SDcF4sto1qJme4c15I7DvUwCgu8huwCjqFA9+FnIIZLHLTt1VtyyZbjF/VDYVe
         RrVJFo6yhUk/SoZgiFWLNGxie6zitgbB58GH77424EBea0ITPYdryXJ2MrAI13mhDNMf
         7GIPi6mYTniVj/6vO7lVIOO0wJ3uIVS/8REj+wFI0A9L5oiCJ82YZEFL40ywyFpqFcYd
         ghg1mpR/MDINfUAvTDOuGJtrua/Gs8Z0PMURXzIN5/QZ39fp1oqo7EI9pU8K/G48HDxY
         8TzLi1E+rAdJD9Y/DOr6vAZdAaoVzl7ZblNnmp5Vx9Zi1KQ6cisoZDwi1GW0XcJQHd3T
         ni9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720454765; x=1721059565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3yotOwh1dtE5DgMK4jrp0VM5GfIPbQCVEmdEcJAa+qI=;
        b=UDRJNyOsbWqUVX6Zr0/eDcmBTdU+HWnZ5sBU6TBI44oUx2ATRI+cm8Aq67Egl2iS+g
         9r3AB9z9KsRTGTkvwza3a92J1+sxj/tzhS6CoWIDwjWkXXAlOTawiDc0FJOjGfs7+wKO
         Slztm83XHgADRtDXXKZ3dFO9DIYmtlVUp0/2AVsDH/khVq/yMdHnOHMBASgZYVqVwsOA
         /ssbGtGXuz8RxlAmMLizqGZvsLHL6td5OH/oABOIYi0RobxmDP3714u21506CT2ybCjF
         S2bQ+poznhYLTPweTtjHvhOqTjaFTOrjgiaGDWoFqc+48bIOlda7D+GV5wkqNusnPQdj
         v5lA==
X-Forwarded-Encrypted: i=1; AJvYcCU4uolBRhohNcLIvYf9WI6ep2/oMUR46vTNKRjA70jH9uNiHtFZ0O7a+2JzuXm8z72UvpjDGxJ6Dvz8KkUJtpXRHjqrn9hhC+pY4GxcvTZ9rg==
X-Gm-Message-State: AOJu0Yx9rTBM/yM9ZbZ12Jp7rAjVkSbYC3MDZMlZl6Y7AxqQf/g3+API
	Lw2extg5Ty3RvOR3z2BOmaC0oMMq9Alos/syCU8Y/kNDh9Y0Pj0gP7YUsVXgX88=
X-Google-Smtp-Source: AGHT+IF4pL8APdY3c5DhYc7WskK7MW7W4Z9fYaj4VTZU8WRclPesMbXiUmaRA3FuKwavhdhGST/T1Q==
X-Received: by 2002:a05:6a20:db0c:b0:1c2:8a36:29d with SMTP id adf61e73a8af0-1c28a3613d0mr2559231637.6.1720454765685;
        Mon, 08 Jul 2024 09:06:05 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:f189:baee:28ea:c31c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b439b5585sm20701b3a.188.2024.07.08.09.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 09:06:05 -0700 (PDT)
Date: Mon, 8 Jul 2024 10:06:01 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jason Chen <Jason-ch.Chen@mediatek.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] remoteproc: mediatek: Increase MT8188/MT8195 SCP core0
 DRAM size
Message-ID: <ZowOaQ7Atf9D4uoM@p14s>
References: <20240703034409.698-1-Jason-ch.Chen@mediatek.com>
 <f9cbd088-c00c-455f-912b-cc119566e62c@collabora.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9cbd088-c00c-455f-912b-cc119566e62c@collabora.com>

On Wed, Jul 03, 2024 at 11:05:59AM +0200, AngeloGioacchino Del Regno wrote:
> Il 03/07/24 05:44, Jason Chen ha scritto:
> > The current DRAM size is insufficient for the HEVC feature, which
> > requires more memory for proper functionality. This change ensures the
> > feature has the necessary resources.
> > 
> > Signed-off-by: Jason Chen <Jason-ch.Chen@mediatek.com>
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>

I have applied this patch.

Thanks,
Mathieu

> 
