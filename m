Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:36680 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750989AbdDJJAv (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 10 Apr 2017 05:00:51 -0400
Received: by mail-lf0-f53.google.com with SMTP id s141so31426920lfe.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 10 Apr 2017 02:00:51 -0700 (PDT)
MIME-Version: 1.0
From: Michele Rodolfi <michele.rodolfi@t3lab.it>
Date: Mon, 10 Apr 2017 11:00:49 +0200
Message-ID: <CAHXzriF1iW8gBaLfdSjUmmRYduNr35feEXVyBuas9+byQO8CUg@mail.gmail.com>
Subject: Shared memory between remote processors
Content-Type: text/plain; charset=UTF-8
Sender: linux-remoteproc-owner@vger.kernel.org
To: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi all,
I'm trying to set up a shared memory region for image transfers
between processors.
Since the rpmsg buffer isn't large enough to contain a whole image, I
would like to put the image into a shared memory buffer then send the
physical address of this buffer to the remote processor using rpmsg.
I'm trying to understand how to do so with the functionalities
provided by remoteproc. Has anyone done this before?
The remoteproc driver supports the request for allocation of a
physically contiguous memory region via resource table. Could this be
a solution?

Thanks
Michele
