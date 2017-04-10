Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 10 Apr 2017 12:25:47 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: Shared memory between remote processors
Message-ID: <20170410192547.GF15143@minitux>
References: <CAHXzriF1iW8gBaLfdSjUmmRYduNr35feEXVyBuas9+byQO8CUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHXzriF1iW8gBaLfdSjUmmRYduNr35feEXVyBuas9+byQO8CUg@mail.gmail.com>
To: Michele Rodolfi <michele.rodolfi@t3lab.it>
Cc: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 10 Apr 02:00 PDT 2017, Michele Rodolfi wrote:

> Hi all,
> I'm trying to set up a shared memory region for image transfers
> between processors.
> Since the rpmsg buffer isn't large enough to contain a whole image, I
> would like to put the image into a shared memory buffer then send the
> physical address of this buffer to the remote processor using rpmsg.
> I'm trying to understand how to do so with the functionalities
> provided by remoteproc. Has anyone done this before?
> The remoteproc driver supports the request for allocation of a
> physically contiguous memory region via resource table. Could this be
> a solution?
> 

Specifying a carveout region in your resource table and use that for
your shared buffers sounds plausable, but today we do not have a
mechanism for a rpmsg client driver to acquire a handle to an arbitrary
carveout from a potential parenting remoteproc instance.

This is something that has been discussed, but I have not seem any good
suggestions on how to link the two pieces together.


But as it sounds like you're going to have a "control protocol" running
ontop of rpmsg to provide the remote firmware with buffers to operate on
I would suggest that you allocate the buffers (e.g. using
dma_alloc_coherent()) in the context of that implementation, rather than
tying them to remoteproc.

Regards,
Bjorn
