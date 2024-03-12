Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52579EC3
	for <linux-remoteproc@vger.kernel.org>; Tue, 12 Mar 2024 00:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710204932; cv=none; b=Gh1o5k40B81hJn5xXElMLvmJOf1K31+qDRQ8EMAjRSxaagO8KxLU/Mlnq3fff52aPimM1x7wzUh5UjtevrfcIH3dfrf27/GxBzly15Hr0z8wnLV5E8RqwKhMbpj5pS8UTJnvFMEx2XkXk8bqrWha7S/8l8r0qeABpEE7HrkK2/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710204932; c=relaxed/simple;
	bh=jsqyfNEt0TxDtZ+H+pJTRDnuvRvMVS0DcA6RBF1ySg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jhj4YnU6x0GCKLWW9sxPv+DtEcDg2TKI719MptJ+ehN2NxA4MmkuwbmPQrc7yVuLmY9S4UAg580b5PA6kE1whY15lDB7QGtrV9MjKOhLUBH0QGLnvLB7zL1aGdFP5TS4aFQ5Lp4Artm533IvxgKl7anPjjPoI1/8BaMKojN17+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TZ7bWkzQ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TZ7bWkzQ"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-513a81b717cso1933836e87.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Mar 2024 17:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710204928; x=1710809728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PdoIEcD5Pj5IoGiWkY5Edp6gwijkMLmt1mJCGCeVgkA=;
        b=TZ7bWkzQIGy9G5YxB065b/UdEBrV4IlU1Vqel4LsI7ch21F4TtiaGS3KcvPqs1+cZz
         UMu6VYh8N2rLLWH2lRpsIFfid1YxF1t25q2gSkwzpHHqDZqgE1Q6yqlBej/QNaJYYBZs
         u/1EzqAFVrI8SyaOMYzP+tclDYD85RzNGXvvPnzs/J+Rx1Z+cVP8zGSmtX6Jm8qBBZKH
         2cpxNvOkoW6+K6pXnK3K5tVITX0AU/oB1S8zsHxRAa/bNaOurUY/iNF0WpFCvQwj87VX
         2VIufTrBi9+n9cgnOQfXmv1aDdleIsAl8+yqiUP5QYrGj7nMwpMLaOgNuMkjLljkSXbK
         yPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710204928; x=1710809728;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PdoIEcD5Pj5IoGiWkY5Edp6gwijkMLmt1mJCGCeVgkA=;
        b=Y3frUtT7OPqkWZm3nrS8xnaomu+immj8bD2+B9fhdBWAl/T4dD+GfUvnRN21CEG9mn
         N9uooOe2KUWueujlcpS1iV1gdjXV4Vr/n/tpVb6NFh0SDgOfnzldTILpUAkGjLTVY7n6
         M4qsd+K4HvEcAcvvl0Iku3gU+AScQGtxX/d3zcWYRhbPrDXOOwblnAMR9iQEMkbmRED/
         40AyhacazAI4nwe7b5+URkn7xiuX3IJe4QP3p1nDapq8Zpajpi/2AQ2H+KQTQyfTBUgX
         6H8xnbcso0iGusGkcsLUyW+4uvVUQnMqRbpv9djY4zGShEUC8Mw3NXVX3KpD8hQvzwAU
         qGWg==
X-Forwarded-Encrypted: i=1; AJvYcCW7VG8CoHJEJ+6j8yFfoyftVpUt0ivB6XrdcqJiQgfVGvwO0wTKBZbaE6eVJ5TZaquBVmqs1iy1rDLK9AF3ex+FNR3vZXqbXccmocwPnJwWIQ==
X-Gm-Message-State: AOJu0Yxz2brxjubxA4URbbenqjw30xY8n/tiHgQwyZEBwFgdwD5xuDTq
	LZ1XwTwbm+CdCmCh+s2rTbN7NHgnJcm527iOkegUUT42yKulHen1Gq2FY3raSQA=
X-Google-Smtp-Source: AGHT+IH/UsisTDBRXhaCG1Dg+Th26na8Pxiwz2vqMx2ZxUl282ks0HFWJT4eGbyTX7PNkbgsHg9J8w==
X-Received: by 2002:a05:6512:741:b0:513:1cf6:5598 with SMTP id c1-20020a056512074100b005131cf65598mr4257224lfs.42.1710204928626;
        Mon, 11 Mar 2024 17:55:28 -0700 (PDT)
Received: from [172.30.205.61] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id n23-20020ac242d7000000b005131b423d80sm1311890lfl.160.2024.03.11.17.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 17:55:28 -0700 (PDT)
Message-ID: <5219fa82-125c-4b8e-a6fa-e0960181a62f@linaro.org>
Date: Tue, 12 Mar 2024 01:55:27 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] soc: qcom: add pd-mapper implementation
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>
References: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
 <20240311-qcom-pd-mapper-v4-3-24679cca5c24@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240311-qcom-pd-mapper-v4-3-24679cca5c24@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/11/24 16:34, Dmitry Baryshkov wrote:
> Existing userspace protection domain mapper implementation has several
> issue. It doesn't play well with CONFIG_EXTRA_FIRMWARE, it doesn't
> reread JSON files if firmware location is changed (or if firmware was
> not available at the time pd-mapper was started but the corresponding
> directory is mounted later), etc.
> 
> Provide in-kernel service implementing protection domain mapping
> required to work with several services, which are provided by the DSP
> firmware.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

I'm far from an expert on how this works, but to a non-expert eye,
there is nothing outrageously wrong.

One suggestion I have is to use cleanup.h and scoped guards to
save on some LoC

Konrad
