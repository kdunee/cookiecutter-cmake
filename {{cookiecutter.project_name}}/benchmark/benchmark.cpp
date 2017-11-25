#include <benchmark/benchmark.h>
#include <code.hpp>

static void BM_trivial(benchmark::State &state) {
  for (auto _ : state) {
    noop();
    benchmark::ClobberMemory();
  }
}
BENCHMARK(BM_trivial);

BENCHMARK_MAIN();
