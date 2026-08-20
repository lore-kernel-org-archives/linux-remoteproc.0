Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1485474F
	for <linux-remoteproc@vger.kernel.org>; Thu, 20 Aug 2026 02:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787194191; cv=pass; b=Z5UERPyibqs+fXxZoSJ5poAy76ogxH83lmyzBhkwl/ZrmAFHh/nRq21gHgnCX3CtUNNO60uC4aFBVQ8TyZIUQGDE4zJzoBEysdtQPLoaeWtRPH3q8A3kXpMjmgGQkFzeSa4ddlpOIR/DuzhBd2yg5YscbsAgcMrccWvgqxMZkhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787194191; c=relaxed/simple;
	bh=uLQMpCgvNQT6u8o3sYbGoMAuGk4Q75uyM7cKvkGYx4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=addaUhcNGwoS9eGm9O6nSqbCJXf6V1g3zC+ALT+5Yu4nu9b+FzoRLS4Q2ftVmT+MNKPTMt307UbnAhAW/mhdCQOg16GWYCRh1fNree/HQJ33ajxwC2mML3qEdPDgUqjRC7KF54FgN8UiCxrNVJ6qUY54saeSjaIY/AHmyBO+JD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gB87ODFA; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gB87ODFA"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482938466a7so1435516f8f.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 19 Aug 2026 19:49:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787194188; cv=none;
        d=google.com; s=arc-20260327;
        b=ilP9J93ubQSYJ1DxBF/e4rq4sTfv8vOZsGhbrsoI6oqJcBSpDVF4pzVmkRcJVcoD67
         l4FOYL+dVEDX2PJuJopoTb/MkVmGimCEMMsKbXaFTDf8eJLHLLQjm47JIMksc3VCrtrP
         MzTdW8sesZZsKjt+qSVER6463yaLFER81wjb2nkaKkaZJvXzUE4jYfxqFgllcY/WBL1o
         ZoAhMxmC/2c2jTDe490PIm0i+/ja0kOe06IPEuVJAmvz/d6g+GAeEVCDUpRLu0PFNsyZ
         Zd4egZLoEsxHURFDJ96P6qmhul6pN0rKsG5k14N9iXSSM2cjrDoL979JN+8Af4hRUEyl
         RhnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YjNmQZYAyRysXhmwM6mRYoKV8JMLaurjh7mibsD17wg=;
        fh=SuMcnCwzU/tw4FlBcvyhSwRttTd0xNhoajL40qZxcJQ=;
        b=ijUphjIrm+Fnrs70IqCL7tbuLPGQfHAxDoPDMKvDt9lNvuOiQ1TwvX8s0a8SwD5lPA
         XYocMGD0IXuwELVuTtTFzKHgVCxKaPU+P8CT+drrpLqnGo3O8hfSjmEEeej/Qje+lEvd
         e8Gf4uRvqMyC6FFw34lzBsERVqVqAMAIrKdRvk4R1YwL2TZNaeVVWAAZ67KdllQD1lbf
         7HUGvsKpif4KG0zGLtUiwRJqL5ayjiixeLcySDFT47iqY18AUyUa9t3MmoSKa1wk2Wfj
         BXFN1ubxRP4JkDQaZWZzULlAJig5rPLoPhQiXg0H2O4AXePtAeD/GfsbmWPrNsQ9mZ1D
         5pYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787194188; x=1787798988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YjNmQZYAyRysXhmwM6mRYoKV8JMLaurjh7mibsD17wg=;
        b=gB87ODFAiekpGSLtddWdaUdwXpMTmndqQLOpNImKtbN7uLw7It0EztFVs6A+k5dF/Y
         pRBfBHwzg/SEXjSOF1kUNCWvGnYHCj7mEfwF+KONs5mPa3svYJb7lYz09z49j5IEUOtD
         zga/KVC8TdpXgTFE6jW0OdwLSFhzj/okaFFh3cL9MRHNt/t+c/KpUCw6PWIrRfRvcq7i
         pgCIMbwXfUKHTK00EmngpW/t38UcUfehICuuJJUwKhYZnNmM+3fJv0oet1fRkpsNOWHL
         aLwqpNLXtV2nUIvwpzP070IUYcNBFxW+qV0fXDADnh/5djbd+GVkD+1TKk8w77uwgwz3
         dy1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787194188; x=1787798988;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjNmQZYAyRysXhmwM6mRYoKV8JMLaurjh7mibsD17wg=;
        b=UerXizqi6U/ECYcegCEzzRKjja25fE+vi0helZH6/XCe6Ow7xM82wbHxgHFj/WTO3o
         fWwxXCxyjrsnPvbzMkPrkKyFeZY/wNOD65KBTBze9jF6sw93gaCBRUunjYTQ3Kud88hS
         pxTFLs56APRXmTHVXBxwZRl3pwQwibrP7Uu3OAYxqCPMUX3nMQpr84rvjDNcBrNp+dHh
         AwCn1RIIDym0Ru9F5oe94aDlxoZ3tTaP+P7AaraghWMsQbdbhk4mBe1IjS1LFWgWSVZ9
         +MORQxqm47PtKb1rf4RNoZv5PCCiyD63KXPoNpo0/nZ88mEyL0sZS0fMKpLNRJNWswYi
         bb0A==
X-Forwarded-Encrypted: i=1; AHgh+RpmB20KLwm3ifCpdaCEJh8OhCjl6owbjJN2Tz08YEbkmx+nnFiZnX/QxBjfqKAVfdW1YELSDAWTBUNZanJjiVEz@vger.kernel.org
X-Gm-Message-State: AFuF++k+g76y+uUfCZvTxVwWa0G3rTBepjETH/5GWWlt8FKeQGlocuE7
	OWRMsaGi6RwmuV2GbV/pA9od0fmyhSkfBOa6TN0GAqftLkehkelWmSlt84MtVXJ1ZDfV/dsrxMT
	IDNFOjQH5PhCnHmoMxvsk77c9RORiefM=
X-Gm-Gg: AR+sD12Hj3pz5c0XAZ80g5LjrFrTJ+1OXyaB8zTMirQEtf/K8paZ5qA33/Y0CRSdGI/
	6N609dZNL5tJA7wJOSRu62SqXdL0/pKxL6HHLNweNB9FX3Dc2JIV8uV8+2FuoMBOx2zwt5B6V+0
	jqRE/cPRMaWolUTenQaEe7GTuurZJvLdDvfGdhtMGzAPRJ9pWyctcKV3aGRm9M+kCPnCSLrsuhJ
	ZFJ6RAYoty25Bd8FnALhqJdIserQcZF8XfLoI5VReylvEUZj7QzovxtZQyhXYMiYkLtVhyStGPK
	PWwb4FYrCbCou+3MvlHwxqQSaxlgqMLYK9H++RR2D9QT2h9FvQoqjGJmlcOEZvvbM2uTQ8oq51s
	LwA==
X-Received: by 2002:a05:6000:2605:b0:481:4f9b:282b with SMTP id
 ffacd0b85a97d-482b1ff75bcmr15946767f8f.21.1787194187872; Wed, 19 Aug 2026
 19:49:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724025322.2341205-1-sammiee5311@gmail.com>
 <CANLsYkz+h6ONmvhgdfGLNu21J+LrMSySFw9sxRcR4ZxLwPfbsg@mail.gmail.com>
 <CAJciObG2OahhKz+t9pbA1yCHz4pFQLK6EKmZMwY2zxqD33SgQg@mail.gmail.com> <aoXdbENOmRRx2o6l@p14s>
In-Reply-To: <aoXdbENOmRRx2o6l@p14s>
From: HyeongJun An <sammiee5311@gmail.com>
Date: Thu, 20 Aug 2026 11:49:35 +0900
X-Gm-Features: AcwNN1WJqBXTwpFIPKhmgdYqdGaXO0a_j5pDFwI-7i8pt0LLpaEeILUKM4l4EAM
Message-ID: <CAJciObH1ER73km1sf5RtjjoD+1cvcmxt4DsgX-n++=juDmo2Ow@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: elf_loader: bound the section header table
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 1:44=E2=80=AFAM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
> I would assume that if e_shnum is 0, then e_shstrndx would also be 0.

They are independent.  e_shnum goes to 0 when the section count reaches
SHN_LORESERVE.  e_shstrndx goes to SHN_XINDEX when the string table's own
index reaches SHN_LORESERVE.  One keys off the total, the other off one
section's index, so a conforming image with many sections and its name
string table at a low index has e_shnum 0 and a small e_shstrndx.

scripts/recordmcount.h:219 set_shnum() zeroes e_shnum from the count alone
and never touches e_shstrndx.

Thanks.
