Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FBC15A858
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Jun 2025 15:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749139091; cv=none; b=CwuNntnIjC0lJOZtV4F6q7/rkZGsqalbRVqtj5UT0W5YlvNymM4Os/YYRVNrtCsjygow8IuMatZ9KhhuergZzXug1yg8dAz/kOd1BCzCLPhdXbAfNL3e6syWs2Xdu9AwL28+ccqXJXSKMZU/t8TwCmXeGfHbNoGNg6skM5n9w1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749139091; c=relaxed/simple;
	bh=vvxsdQUfbACEHt/eKBX1FbZkUxMW64PwCAQm1kKd1aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVYcvD7pOLHvk9Zzwnt8T+GD7XcWJY1I+MRiEDbfJm7Fj6edHzP+hfRyS4Fk4GB7esZFIIOnbKeEeTwjC0eAjmtAWwDUglgOvWd9vTZAyBRx/zdZvFpeZJT14cf7iH9xwy8yjzHcWzQKMNkNteujtoW5WBlRowJpbjFLmYis7Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=foundries.io; spf=pass smtp.mailfrom=foundries.io; dkim=pass (2048-bit key) header.d=foundries.io header.i=@foundries.io header.b=Yogg4UR9; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=foundries.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foundries.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foundries.io header.i=@foundries.io header.b="Yogg4UR9"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55351af2fc6so1488378e87.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Jun 2025 08:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1749139087; x=1749743887; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kJR4Y8tAlCR5oc9EbaKSTjEuRByyyWL0IrWS9MKBoMo=;
        b=Yogg4UR9qXNQnQXykkygTXAAwxWobGNHOHPlm0CcF1Y5PaewbzNNS1uOyM4Wr9pSLt
         noRL59WF148p0TeScTzDsmcx3ngys2nVfUyj+l5bIaOFrCQ9sdhsY39hUslxFWw3K3iF
         oc4oeA4RDciQ5RwDti9H26qL4aWWdzZaWh+VAmz74CEPu78dsw7CjZllDhP3tBtfJrkX
         88XLTUUUJOKprfCN+DXy/gfvB5eDOGnPKL1k8sPu76o6s9Ne0Qo39GexQi1TLJjyExe3
         AXHT+iR1zid0Qg5RrP/q45hNi0NdaBc2jUifChK9BDSfJ6Nb6NlYLSjmsexNsAELRgHz
         4D+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749139087; x=1749743887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJR4Y8tAlCR5oc9EbaKSTjEuRByyyWL0IrWS9MKBoMo=;
        b=OAX/BWCu8rnSALLhOA5YuPtLlmqOt3dGwpjlzh235SmHEqVzyRclb7jLKqnDrqanBo
         Ur6mYOp1uPvmC5PMhTgQrJXUPeXURwcJL/VJoc38S1eK/+jkpVc9Y8sKvwHuNhWRwNiJ
         AlVFqR1mbZ/cgYYGS8A3eRFB05R+KuzigT2M1TI8cdLAz3yZXrlmJabTOiO/iU4lxwQ3
         UyZTduP7vZ3QDIyrW8QDmO1nUU6AB313dNj6pb/G8RvpjP3wLALBgYP0H0/3j14lsLEP
         1yaKMdDwjIjDmjfuNdR2/6EILiWecJzB7tvCVxEZcE0yJc2MRu1dZR2LdRmIyTOfrTe8
         hU+w==
X-Forwarded-Encrypted: i=1; AJvYcCUQN2pgGjZW3tU9CsoGUuPX/9jqEJgkuaTXD0cURTFPKu9G0QqVl1UdcBEkZ8p4tsD4TSg739pOGPdTAn4vM/kZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzTfzmjCrbZbo0wMYrQIpRd5CVqrACkz0sl//60MxO2ocZ761Ig
	JovLPPr08WQRcvLWKPra1aJbUmbhx80GEfs5bsPSWw/1VrccoZh5Dmv7EgtfZhByMFI=
X-Gm-Gg: ASbGncuk/6XzRweyx0f6C4UwDGmx8fuGQtO7+RD0qzxgTKVJ7iq3wn1KLYNEUgF7UPa
	aYvKKFiQ9HQvIfG3GyHkuHpOJp/Hl/8XIFRik51l8e2SDsGrAxDCrKWAcqDpSh0LSKQQ4xESkIG
	F3oSxAQyyo+v3UqF90U1a4iVVQQIxF7THB0+5dC/foYg2x9tWb1wqtb2WpRC9fv9X+9iYpehJxp
	YB1Ei4nSCYTNYnXF2CufllzMn4qMBRJECJPJOOIYeciJrkyAgB6DKFECitQHswjJyhoLfnMS8we
	ycR6fw7ITX/0S5pPSoKP4xpXhe4JQvn4Dg878NhZA6puA+Jccdw07dnTzXilpPpXXKOERwd8DuM
	3E9fWDpytpqR8DmDggHvm2+7Ac2t7DBipi8F1Yprmc9gS
X-Google-Smtp-Source: AGHT+IHjllPDbBesbytdFFuw49H9HPzHUpGX6GEe0oIbdOiIF9gTADeGFDpUFlmOhHLdYd5ybMcj7Q==
X-Received: by 2002:a05:6512:1195:b0:553:2633:8a63 with SMTP id 2adb3069b0e04-55356bf0810mr2501601e87.17.1749139087260;
        Thu, 05 Jun 2025 08:58:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55365174a43sm69173e87.6.2025.06.05.08.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 08:58:06 -0700 (PDT)
Date: Thu, 5 Jun 2025 18:58:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@foundries.io>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/3] soc: qcom: mdt_loader: Rename mdt_phdr_valid()
Message-ID: <uomne25xskd3iswn7htoqbwvyws4fivogfkhhl5tz4t3uydsrv@sfiivkwxmfsd>
References: <20250605-mdt-loader-validation-and-fixes-v1-0-29e22e7a82f4@oss.qualcomm.com>
 <20250605-mdt-loader-validation-and-fixes-v1-2-29e22e7a82f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605-mdt-loader-validation-and-fixes-v1-2-29e22e7a82f4@oss.qualcomm.com>

On Thu, Jun 05, 2025 at 08:43:01AM -0500, Bjorn Andersson wrote:
> The function checks if a program header refers to a PT_LOAD segment,
> that isn't a hash segment (which should be PT_LOAD in the first place),
> andwith non-zero size. That's not the definition of "valid", but rather
> if it's "loadable".
> 
> Rename the function to reflect what it does.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/mdt_loader.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
