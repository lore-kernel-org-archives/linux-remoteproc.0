Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9252773C3
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Oct 2025 20:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759953905; cv=none; b=q20fG55YL08WqZWGUq2iBjzxd4foZvCbN2k9YropdkaYX1T2LU69F52SeKyRc+7Ba9WKkgUlqu4K/wK9YPGBFQjjd/v/k0uzkWZalMU4AkoQ9BaUC90Ns00Ph9DtsO45JwM5FUZVPDaSlFuyliV33PVsXVQ4uFhASNChXWh5hOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759953905; c=relaxed/simple;
	bh=gJ+kQ8Th5n7sm7JliFtNiVYTbO+kOF6/EavJhQDsQHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fzBkh5ZpSB0N0wPQqvaTasczSs1KtySlUpdhiUSwXvwB4pZT4WIcwHZTl36xD/r6W/8z+A+A2Uhk4zVtav8lLpbFO7CTUI1mBPwqRtGnNZesc/CraljEase8Wrbnkp2U1CYwj138qDULysDFHpQM1ZTTKWzJpLzqGVFf7uHuDj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=c3rWTybu; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="c3rWTybu"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-639102bba31so420668a12.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Oct 2025 13:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1759953900; x=1760558700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3kxgqcyx0jP4OzWdmCcz5dhr6b/zaz3Exv0oc29FIvs=;
        b=c3rWTybuA8JzZQRVVgPh08xP+Y6vhu38n3jMNnMXSW0quajeRcWQFEN6EK8kBNQ500
         LgiCtlYIvZ6cXrnJKNBkStFlXfTHxC3yjriHuNsvaUWBTjYph7ODhPLND85TsFBbM0Bn
         dnjVEqBn1b0qMVz89ykOW6aHXmQ3ij07lbleum01z/sZgAIHaWz2TKYyWE+53hDVKzNv
         v23uBlBW9tp6AdCY65Mf6/X7XywSQdmI4MnN8SYkf+c6GOxrFQFniK0oihSY/8Mn2uiq
         78oAGoKmTE3uRzvOJhGDjw0xHBV4stjsyWUddnceDrein9EP7/QSRLWrTsZwgg0F0vFk
         qZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759953900; x=1760558700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3kxgqcyx0jP4OzWdmCcz5dhr6b/zaz3Exv0oc29FIvs=;
        b=m2eZXXYlRgb+oHWwhGHTJJqbyqUL3yHYkG7q7Bp1/Ya1lYtqhN0YzF3flVZ6KTyXlq
         X6ciZgoQ1ReGZCqqsY9ilhfo/qdScdADXRuOn/hz3F84viWzbX/9go0jV11XFV+0fjAP
         jdxY2/UQxA/9XWbiCTrW6KIHVHY3yVHhYq70Bnxz0iTcJDibtR8d9m/PQlaEWwEisTE0
         fubLy1QDGdO33RTjInUou7f4tIGm5Om6BDE4bAxNupIhkqwNVp5/GYJEQhXs29PGamd4
         Kymxilz8kBqq2hXQKY5+TrWFf+gtK4+K+S+NwiwuCvdh+rUkdpMzCLnma8gyV/yTWRbQ
         PSfw==
X-Gm-Message-State: AOJu0Yxv43E91xjeWixUXJBAPiVXxzZvV9ZCi2MYF2ysrU4nyJqKAmPP
	JOYrTd09s1diqLpRq1pnqOnJku4RnXFSd8IlIDIujru5sCxaihSFJMX1Jit1Z6/aI7ijQy7Du1t
	mjmTx
X-Gm-Gg: ASbGnctNfsYNOPx2udOGRNHjlLwnnz2WBp7WPcjvSDGIGpryCd2Lrq6ajPkD7jbMJgp
	iJ3jkUtPJfei09+XPwy1qBDB7qD56S+5Vo457M+0oO+kykIOviqpmM2yFIeItkQ3wIIHWde54dj
	yR7nJI+9YjqTUocMih9rXOzvAE/DffvPr0VY0c51Yzp5l33x/f9DJ+MLCj1w2Aj6HSwmvZ1vblj
	HYcME5/84GVTz5JkrPcYI6DbPJI07UywFsaPBXtwc2QoT9bc/83WhHUQRVTgjQ/MXWNxXX1PREo
	tSJ+CYfWZ/erCVM+UhJ2Vro2VJxASf1x7Dyvwmavm4JC+K1RMzTF2c7hNYqz4xX8XSEF0b6XzT4
	sslH+JruRUUzeur4ff3kSwVofeY7RoSuDbOxPiF/MDbfJS4MjCU5ApkAjqBaFD4nXAlKuz6SDYk
	n+mKRuznh6vZ8=
X-Google-Smtp-Source: AGHT+IEXXGVckslNWliP/tNzD5inE9P8uAQLj9Hu0Y4ERfwHRS/k5BADAG308Wsx5e+ABMKUAZeSfw==
X-Received: by 2002:a17:907:3daa:b0:b46:31be:e8f0 with SMTP id a640c23a62f3a-b50a9c5b3c8mr584397866b.3.1759953899643;
        Wed, 08 Oct 2025 13:04:59 -0700 (PDT)
Received: from somecomputer (85-127-105-34.dsl.dynamic.surfer.at. [85.127.105.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869b4d9f5sm1758754566b.66.2025.10.08.13.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 13:04:59 -0700 (PDT)
From: Richard Weinberger <richard@sigma-star.at>
To: linux-remoteproc@vger.kernel.org
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, p.zabel@pengutronix.de,
 s-anna@ti.com, t-kristo@ti.com, afd@ti.com, linux-kernel@vger.kernel.org,
 upstream+rproc@sigma-star.at
Subject: omap_remoteproc: Deadlock due to runtime PM
Date: Wed, 08 Oct 2025 22:04:57 +0200
Message-ID: <6460478.iFIW2sfyFC@nailgun>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi!

I'm seeing a reproducible deadlock in omap_remoteproc during system
reboot or shutdown while the remote processor is running.

The deadlock occurs as follows:
rproc_cdev_release() -> rproc_shutdown() -> mutex_lock_interruptible(&rproc->lock)
-> rproc_stop() -> omap_rproc_stop() -> pm_runtime_get_sync()

pm_runtime_get_sync() triggers omap_rproc_runtime_resume(),
which attempts to take rproc->lock again, leading to a deadlock.

In other words, rproc->lock is being used within the omap_remoteproc
runtime PM ops, which can conflict with other call paths that already
hold the same lock.

It was introduced with the following change:

commit 5f31b232c67434199558fd236e7644b432636b76
Author: Suman Anna <s-anna@ti.com>
Date:   Tue Mar 24 13:00:32 2020 +0200

    remoteproc/omap: Add support for runtime auto-suspend/resume

It seems the lock is taken in the PM ops likely because rproc->state 
is accessed, but perhaps this can be relaxed or refactored to avoid
the circular dependency.

Has anyone else encountered this issue,
or is there a known fix or approach to address it?

Thanks,
//richard


