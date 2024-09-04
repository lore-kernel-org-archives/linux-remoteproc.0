Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBD57EF09
	for <linux-remoteproc@vger.kernel.org>; Wed,  4 Sep 2024 16:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725467977; cv=none; b=IDfJ1ueYVhwzgH4vvRDdu0z2Jty5LYi0OYYR7pNIl/0AnJU4Z3RA5XKp2pBfwrbPZXO/RcxKxRe0wLdlC6TMFk/0hfzHSN5d636T7UXXc7zJYMm8PGOzR+hTruHyIslTgkbSFbZ7ZWuOVhJ96lMFY2IaumA5EQYplV3fjImvBnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725467977; c=relaxed/simple;
	bh=GufhHLbygatHBNsiTWwv+gKFNnqliVaPE/vYfJSXK70=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=gLsjKdFNnhh3aFoSEv1b+KFjggiD3HT0/6V/jh+2hSXkXDD+Ai23iBBi6tqe2NfejAKuzoGAdT9E6vNKN3n7iGoBT94ROQswc+0mEQyzy3GlNFe+PWC47tURZjpckybSsEarYyv9xSrWw3G4YHCLBfcl1U0NAmSvIaBUUcXcwmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AyyMlesQ; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AyyMlesQ"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c241feb80dso1935252a12.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Sep 2024 09:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725467974; x=1726072774; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GufhHLbygatHBNsiTWwv+gKFNnqliVaPE/vYfJSXK70=;
        b=AyyMlesQqlNVUgAU1grqd8w810t6tCiKeYEziIU6z2pzo3ODzJpHxElFD7oMMtV9Bk
         b2KCnuzZwoC3QbUiAVjI+QxrTnzdZu46sRmJjJvD3xUYomanBZmidtMPsY6YZWIgqQOT
         5w97QRFP/s4RtlBPOQk+7BEQGv1Uomv9PnUtf2X8xO77F/YONhQZOmlaKhTmdj6ODj7e
         iycfI758K22kbmW7XbYxBZoH53nwl56WAXfrclxd3qOVBFeFoT6lPvrSBbgqU/DUE2GF
         B4nx9Gar/HN26tGTZHVC7nlBiOzFjwXbC3BSJ3GcMNHT0dXlMeTqeouxXu+BYTP6rQIO
         vdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725467974; x=1726072774;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GufhHLbygatHBNsiTWwv+gKFNnqliVaPE/vYfJSXK70=;
        b=ecdFhRr8Ac9SohFWtvdEw5vqKdaBMymI+Q6JGHvS7LktJCqSg+DxZ9BMnSC+08FXak
         sVXXL6bxBBtrzkcTU43H+lE5TzYTVVXBhEP2yN01HrW1axffRjOuFb30+DqcDA+MmA/q
         5ZUuwXIALuUW0lw1iUz/5cSjBGc+a/FS2eLQXoSopp7kTS2x9YzlqmLe7OFWeTA91PGQ
         SKgHPAbvvW5XSxdjYK8dNEaXXBVXenEY4TKRf6wzy60mUI8dhSW3JKHYxgmI39ZgxFTJ
         GSCFZpMf+W5wmDrzOEtYsDMZUWND9rjbI+VZ+GgZZBlkevFd/giS+ojhCW/zyhlUT6dq
         21uA==
X-Gm-Message-State: AOJu0Ywg7KaU8MFbqUqd7t1fb4Z7QFusjtWP/GmME9xahjJR1FROCXDN
	CtC5LtXX3UYnVH1qRQjb7CuG54WEHprkLQn852cKmT7nD57hSnBkzLKoYyqmH717j1AETd3qI7m
	hfQ7GJmZgHImJC6QG2/xFVq5YryoSu6Sp54TAo20Qej/R5kUURsI=
X-Google-Smtp-Source: AGHT+IFHmUypP7gtml9HrNDb1eIo8XgqSDzNxVy9gLk6mXg7JaFJJ0tiQPRzjv4ehUgnzLiTNT9/bD/RqGJr8JJKXy8=
X-Received: by 2002:a05:6402:3509:b0:5c2:76a3:fba4 with SMTP id
 4fb4d7f45d1cf-5c3b291f14emr2819963a12.0.1725467973735; Wed, 04 Sep 2024
 09:39:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 4 Sep 2024 10:39:22 -0600
Message-ID: <CANLsYkwmPChbvxTV-mr5ziD95ni_8cV39qoToi=J=w8Yz+xx0A@mail.gmail.com>
Subject: Remoteproc/RPMSG patchset review order for September 4th 2024
To: linux-remoteproc <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

[PATCH v9 0/7] Introduction of a remoteproc tee to load signed firmware
