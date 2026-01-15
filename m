Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334EA2857CD
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Jan 2026 04:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768452646; cv=none; b=UpNfsOCznLtAph00PdRFjLeqsJgw4AtBb8cYT/OsFUQbtHlCZlmPHr1KJ8o3l2X9h2EIDp+l9ARiRjVbGNe33SYWsdJFkkOF19wN/W/z7GPeaM3hcxWia/VzfHdd/37nS70mmeuqFZ0MNpAzuM+mbbyKxEE+oSN9pvlmHNXb8hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768452646; c=relaxed/simple;
	bh=bwH7TKQitdKzloCZTOTMKs7FMvbuDSsPsScuXO2XnSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DYSU/evCCIqzkXKJnAHRgLQRFeX/zYRnA+rDv1fuYPuhEXfpHWsidBJgjpFzQKDyUoxVXgLbS9TiBro/dYepiWf2nQ+9C9FbAEfQ3v7WEmDb9DDd5qVF2L6rNPtBa7GhHE5bMfcXmKHoUVy/tLKn92S+5DsXKFLcwg502HT7NKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VAqV74t/; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VAqV74t/"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4041b3c1fa1so205493fac.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Jan 2026 20:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768452644; x=1769057444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gaxkG3FjcBbVuAmcMeHgDVclONwI7K7qJ4Bb/eS73xU=;
        b=VAqV74t/w3hqcpKjdurhyCLdERsArrjqT4Nh7ItvYgIORi1xyGz6fnccOymsJYnO4V
         HUAAdkaLwnEOoDYkapMZEsrDOruvgYHBj8I0lDbmAAG+ddByUstdzjnmnLn1ycivhusD
         sTKkUZ2N2+pDlinagoD5mNzDjZS2MVofA4Em1tE+0LY/PnV84xn7DDfZwqy2tM0RKue6
         TOOTvICAZfFAnJm3hbjS+apTERfDw7KcFFJe/NxnamvrY1whsXqHLx0MucFIdKF2vX7O
         QwLCuSRxYtRIoBhHxFjMyJy91QEtxTiVGUwEfVSnDeHodnz/YkAKeIg+oE0dTXmgEAPD
         Z/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768452644; x=1769057444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gaxkG3FjcBbVuAmcMeHgDVclONwI7K7qJ4Bb/eS73xU=;
        b=rL9+J4htsnx9ARG6R2OEPJBePOpkgXs8UySt0ZcFCN/xSMo1JPQRNvgo2YhpfnKTqO
         jud+xgabIVWn4ZyyL/SEivxZjAudFbjAH+y/mv5wi0528fi1MF4YC19w1gbPslNERNwe
         1LQuFH0OLqHGEbwDbhV84pSjNPbadYOaCoHi1ohDLqgF5L3oVlRmz6ICzY0gMyVuO51t
         MyPw2XcPodPG3JlU/M+VZrRhOdFgS1l0STDGXpumdnV0EVW2l3v2bGgFV4pg2Agn2SiF
         Xrbuw/5Z4bUrze4Mhv8eUpzdeeHQg+ifu00OU7f9YaWWqBXXGSkR1YO2pt4k/xxGcaQ+
         56Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWlFX7k720tEzbQSXQ+NFkdJviBGVLyTwVI+6ob211FDVXt/L/d/EvxgQX0gRzyUssLIuiKahJnqF8zFt7OEydq@vger.kernel.org
X-Gm-Message-State: AOJu0Yzol1nZH3Yq2WJuT4R/ZWodNZ75ascme6D5/xiVAPxAnIzMH9GI
	u4IHINyJpPEZHvAER6+rO/fyhPoaWn/Mm1p4GXqIoBVwI2i9ULyGu2EY
X-Gm-Gg: AY/fxX594/MOzBsE6ORCUVmh5s+99TUeeOlco+cZI7jKCYK/zmQT2uXzW9EPwRJ62Q4
	NIKyI+Sgk2CxospDvU9Dx2RmBD6v5GwN5jRW7XVMh9uH/tfalAy8Vf2UdkvSrZ3ZwgqZlZc9Jh4
	NtvuVvJGXeq7GwdxY+wYBHhlQHc8GE1wwNxzPJH/0noh35HEyqd8+crBk3vZkS3sYct5p2ZqWYB
	66aYZZgaNLWt3HqdZuxsit0lu2rQyrWda2oEM2UGMOhjdNtm4Rob1eaNXPKuxjr/pgW2OGQXQB7
	mS7DDLZ8PgOzTbO8wnwVN7YI4R/bKl5b0Xn7AZ+eWkorjPo9n/jUYZYdSFlkqBgLgZDgh71Ni7v
	OC5NTTyqevqlTBpsQT9dkw7ubfw356M7h1Ia8RVvWUv/twe2mRGxv61LMO2ltOQLBDL+MZnoJem
	esnR5EMzhGH5lJmWoiMTRZUrfJwABL/7Jzy9F2jR6Bow3nTIo1nGQnsFDejnW5HQn0UNqpYx5RC
	kWZL4t94L8//747LCIUHvHsaj0O3iE=
X-Received: by 2002:a05:6870:c0c3:b0:3ec:4266:13f7 with SMTP id 586e51a60fabf-40407197688mr3586919fac.29.1768452644055;
        Wed, 14 Jan 2026 20:50:44 -0800 (PST)
Received: from nukework.gtech (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa4de8cbfsm17750746fac.3.2026.01.14.20.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 20:50:42 -0800 (PST)
From: "Alex G." <mr.nuke.me@gmail.com>
To: andersson@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com,
 linux-remoteproc@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Cc: mathieu.poirier@linaro.org, robh@kernel.org, conor+dt@kernel.org,
 konradybcio@kernel.org, sboyd@kernel.org, p.zabel@pengutronix.de,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject:
 Re: [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native ipq9574 support
Date: Wed, 14 Jan 2026 22:50:40 -0600
Message-ID: <5206383.iZASKD2KPV@nukework.gtech>
In-Reply-To: <cfa31127-2208-4c65-b8ef-3b5d534e050b@oss.qualcomm.com>
References:
 <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <4814455.tdWV9SEqCh@nukework.gtech>
 <cfa31127-2208-4c65-b8ef-3b5d534e050b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, January 13, 2026 11:42:45 PM CST Vignesh Viswanathan wrote:
> On 1/14/2026 9:24 AM, Alex G. wrote:
> > On Tuesday, January 13, 2026 8:28:11 AM CST Konrad Dybcio wrote:
> >> On 1/9/26 5:33 AM, Alexandru Gagniuc wrote:
> >>> Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_wcss
> >>> driver. This firmware is usually used to run ath11k firmware and enable
> >>> wifi with chips such as QCN5024.
> >>> 
> >>> When submitting v1, I learned that the firmware can also be loaded by
> >>> the trustzone firmware. Since TZ is not shipped with the kernel, it
> >>> makes sense to have the option of a native init sequence, as not all
> >>> devices come with the latest TZ firmware.
> >>> 
> >>> Qualcomm tries to assure us that the TZ firmware will always do the
> >>> right thing (TM), but I am not fully convinced
> >> 
> >> Why else do you think it's there in the firmware? :(
> > 
> > A more relevant question is, why do some contributors sincerely believe
> > that the TZ initialization of Q6 firmware is not a good idea for their
> > use case?
> > 
> > To answer your question, I think the TZ initialization is an afterthought
> > of the SoC design. I think it was only after ther the design stage that
> > it was brought up that a remoteproc on AHB has out-of-band access to
> > system memory, which poses security concerns to some customers. I think
> > authentication was implemented in TZ to address that. I also think that
> > in order to prevent clock glitching from bypassing such verification,
> > they had to move the initialization sequence in TZ as well.
> 
> Exactly, the TZ interface is present to address the security concerns.
> Also, as I mentioned in [1], on some platforms, TZ might access protect the
> clocks and registers which might prevent the remoteproc bringup and throw
> an access violation.
> 
> We can keep this support added for IPQ9574, as it is good to have, but can
> we keep the default compatible in ipq9574 DTSI to use the TZ interface,
> which has already picked up an R-b in this series [2].

I think that's an acceptable plan. For the TZ case, we'd have to keep the 
clock framework from disabling the "unused" remoteproc clocks. Do you think 
"protected-clocks" property is the right way to do it? Which series should add 
it?

Alex

> 
> [1]
> https://lore.kernel.org/linux-remoteproc/21468f66-56df-43ea-99c2-7257d8d6bb
> 7c@oss.qualcomm.com/T/#m688033ab79c63a8953e38f5575d1c0ff6b37b13a [2]
> https://lore.kernel.org/linux-remoteproc/20260113092021.1887980-1-varadaraj
> an.narayanan@oss.qualcomm.com/T/#t
> > Alex




