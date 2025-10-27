Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859092BDC2B
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Oct 2025 07:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761548939; cv=none; b=p4j6vdNpzVzZK0tDX95S4OleBsaz0GSnKB7H49UoYlFWySdIwpr3JuxnsyIC7N21rwZ3CDu+7Okjw0Ud7EkLItARpmJgFf1B6APZhoPHOa/nShccprIazIIVqer6vUHuaOBbhOi1Pq9dAWElqDaAXJ3F1lIJFxZc2T06+HmLGm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761548939; c=relaxed/simple;
	bh=HQvYDUNf198EKKAxVvh+ZSxI78/Ij69G0JiG7PtT5fU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BE2fMw8+eoUCtFTIFM1hNDSUCd0pDxA1WecsqvRpZtjx+Yo2sNT/kbsd6JMYLj3AIVVMrHeq5VPqzfKfpnlrNevERjEn/eHunKSZmihNdzFA66gN6Y5eVplEKoixwsgIWM/odJW44Ag+34kFh/grOMinIBCBiUWmB1e6Xfq+54I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PwQIx+zL; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PwQIx+zL"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4298b865f84so2284781f8f.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Oct 2025 00:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761548936; x=1762153736; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2VCn7I67W0lot093gUV4e8FUZ2HcsegXwgZoOoSOv7c=;
        b=PwQIx+zLauUHHEW8zaqrUsBUrTClf76jPTZtESzTKlGd6SmI/lyTRiWjV2aq3XKLt1
         2e7HGVUgC0PA3jC4M57VHP5eMsac2tYnF2mbEkIQS+CN8H6Evhu/db3eYOEaK1pZX+Nt
         Q2LoEgS4uSMYYQqBCyfjdjKP2qdeiCip/s3jQFLKOKeZNGSvBu0f9r9DPtfypLbOxp8k
         zs2K0U/DIxoetHY+/1B3jsN4anL/+kf1wEx7E7vl5I/uA4xXEfbvhkzMB/qmMFIT1tH/
         Tizc9iafVA9a/QAsbkTCxMmyKP85rO5AGKvjAAQKmT75q9Z52DAmxHhTs1S8Xjw4NzYq
         LuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761548936; x=1762153736;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2VCn7I67W0lot093gUV4e8FUZ2HcsegXwgZoOoSOv7c=;
        b=VQSv341jv4dTpJikNDhj5FCvM4Nb/aQ07VKR5oyrVxH3+fMsYAz8ZpwErHzUjdBQhX
         5CrD0T2ADS1V96NQ2yCibP8YCZRONToGlYKxy/hUWd09n+gTLCaYegOsj4u2SMeIBkBx
         cKHAF3Tqh+RVw0IVngFAJ5asIGwq8caqjxu5YYHaBmUxYVuxOKkdNlOmruxxuQdZwt7D
         kR4/vhBpwoIcv5/GchAkihD/t2SW0BsHfkez6RVwVkatCpxVY7QCTFy/KTijLC8OqNXV
         bga3idPBWJKeVcM5DnLIeeAHWuz4HyxdWOvX85+YKie3eIC5fujiO2qAs66QuyJnBNHe
         +3Uw==
X-Forwarded-Encrypted: i=1; AJvYcCU4ksth0VBzbs/1Dn8Sx1pwLWqTWnj7HazEM29UM7K23kDjjEZK3Htxd+OBsUmdx1Okczvz12qUfogJmbHwoWBw@vger.kernel.org
X-Gm-Message-State: AOJu0YwDeybrSYqoNXSKUHFzr8hA8iW8VXllRbsOccRb19zWMBNTWB+6
	5yPCB9eZ+QPd+Sc01sjKtGXxM3Xctd/hfXr/5bJimS7n+I7hJ4SFg7BDsv8IbZLfeMo=
X-Gm-Gg: ASbGncs87qk+XFIntfOG3DpnkIxJswmiwWm57LfmKhCEoV6DWGP3JwegDoc2jaeQL01
	3MCqo4tRvql5VZSSXwvDlHXqLf7f74u9UWVdtSpn3ANDzGMWfjlfs0eKD5g8aQZlP5xM2cqCXCa
	TFbgEid6SrqcGTHN4Xo8+NilQsmue5/Tg5BrVpUb3gbAEOYFQkqiMjoOGl00i0xWqxNuamvVFfZ
	fvGfAE7GkE3weEIPZLF5UGCVuCG8Iv+R42nAsDkJJyyWhGmZQ0VTj/rd6OAixNC+mFRgfnwA0It
	yDrhVSJ2Pd9Uog5VKfursTppht9uC11m0CNKXWA6xlC7y4jaXuuK8ck2EQKX1dPjigjR0P4a/SE
	1qRQiDq459cRc1+rkLS7BtHXg7HzNcqrg5qrkVgbtEJRx5rSa1wPAGnfpi7Hri6gyMaof+EdPPB
	jWb/aBksfue89f29XE
X-Google-Smtp-Source: AGHT+IGoQx8B5H77NlYFS00H5yXNOz5JUZs/694lcXu0yPBw3rKGoC7GgPX+DZXHN83AY89E6HX4rA==
X-Received: by 2002:a5d:5f82:0:b0:3ec:db87:e8fa with SMTP id ffacd0b85a97d-42704d768b6mr25913703f8f.26.1761548935732;
        Mon, 27 Oct 2025 00:08:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952e3201sm12634747f8f.47.2025.10.27.00.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 00:08:55 -0700 (PDT)
Date: Mon, 27 Oct 2025 10:08:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] remoteproc: mtk_scp: change the snprintf() checking
Message-ID: <aP8agyKj73bLZrTQ@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The snprintf() calls here work but they have several minor style issues:

1) It uses ARRAY_SIZE() which is the number of elements in an array.
   Since were talking about char that works, but it's more common to
   use sizeof() which is the number of bytes.
2) The printf format is "%1d".  The "1" ensures we always print at
   least 1 character but since numbers all have at least 1 digit this
   can be removed.
3) The kernel implementation of snprintf() cannot return negative error
   codes.  Also these particular calls to snprintf() can't return zero
   and the code to handle that zero return is sort of questionable.
4) In the current kernel the only "core_id" we print is "0" but if it
   was more than 9 then the output would be truncated so GCC complains.
   Add an "a >= sizeof(scp_fw_file)" check for output which is too long.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: The v1 introduced a W=1 warning because of the truncation issue.
    It's a false positive because GCC assumes that "core_id" can be
    every possible value of int but actually it can only be zero.  And
    also generally, in the kernel, truncating is fine and it is fine
    here too.

    But let's use that as an opportunity to do more cleanups.

 drivers/remoteproc/mtk_scp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 10e3f9eb8cd2..db8fd045468d 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1127,11 +1127,11 @@ static const char *scp_get_default_fw_path(struct device *dev, int core_id)
 		return ERR_PTR(-EINVAL);
 
 	if (core_id >= 0)
-		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
+		ret = snprintf(scp_fw_file, sizeof(scp_fw_file), "scp_c%d", core_id);
 	else
-		ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
-	if (ret <= 0)
-		return ERR_PTR(ret);
+		ret = snprintf(scp_fw_file, sizeof(scp_fw_file), "scp");
+	if (ret >= sizeof(scp_fw_file))
+		return ERR_PTR(-ENAMETOOLONG);
 
 	/* Not using strchr here, as strlen of a const gets optimized by compiler */
 	soc = &compatible[strlen("mediatek,")];
-- 
2.51.0

